%% CODE WRITTEN BY BASABDATTA SEN BHATTACHARYA AND IS A PROPERTY OF THE
%% UNIVERSITY OF ULSTER, NORTHERN IRELAND, UK. PLEASE CITE THE ARTICLE IN
%% WHICH THE WORK WAS FIRST PROPOSED WHEN USING THIS CODE. THE CITATION
%% DETAILS ARE AVAILABLE IN THE README.TXT FILE IN THIS FOLDER.
function myinput_ver1(block)
%Simulate extrinsic input to a cell population
setup(block);
%endfunction

function setup(block)

%Dialog parameters are, in order, mean, variance, time of simulation (msec), flag
% There is an option to give a constant input to the model, in which case
% the flag will be 0 with a constant input at mean value.
%Else, if flag=1, the input will be a random
% noise with assigned mean and standard deviation.
block.NumDialogPrms = 4;
block.DialogPrmsTunable = {'Tunable','Tunable','Tunable','Tunable'};

% Register number of ports
block.NumInputPorts  = 0;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompOutPortInfoToDynamic;

% Override output port properties
block.OutputPort(1).DatatypeID  = 0; % double
block.OutputPort(1).Complexity  = 'Real';
block.OutputPort(1).Dimensions       =  1;
block.OutputPort(1).SamplingMode = 'Sample';
block.SampleTimes = [0.004 0]; %% MODEL SAMPLING TIME

block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions',    @InitConditions);
block.RegBlockMethod('Update',                  @Update);
block.RegBlockMethod('Outputs',                 @Output);
block.RegBlockMethod('Terminate',               @Terminate);


function DoPostPropSetup(block)
%% Setup Dwork
block.NumDworks = 3;

% Dwork(1) holds the noise vector
block.Dwork(1).Name = 'noiseVector';
block.Dwork(1).Dimensions      = block.DialogPrm(3).Data;
block.Dwork(1).DatatypeID      = 0;
block.Dwork(1).Complexity      = 'Real';
block.Dwork(1).UsedAsDiscState = true;

% Dwork(2) holds each element of the noise vector
block.Dwork(2).Name = 'noiseVectorEl';
block.Dwork(2).Dimensions      = 1;
block.Dwork(2).DatatypeID      = 0;
block.Dwork(2).Complexity      = 'Real';
block.Dwork(2).UsedAsDiscState = true;

% Dwork(3) is a counter
block.Dwork(3).Name = 'currentIndex';
block.Dwork(3).Dimensions      = 1;
block.Dwork(3).DatatypeID      = 0;
block.Dwork(3).Complexity      = 'Real';
block.Dwork(3).UsedAsDiscState = true;
%endfunction



function InitConditions(block)
%% Initialize Dwork
block.Dwork(3).Data = 0;
mean_noise=block.DialogPrm(1).Data; %%noise mean
variance_noise=block.DialogPrm(2).Data; %% noise variance
std_noise = sqrt(variance_noise);%% noise std. dev
simlen=block.DialogPrm(3).Data; % simulation time in milliseconds; 
                                % so for 1 minute, the entry will be 60000

flag = block.DialogPrm(4).Data; %% decision for constant input (flag=0) OR noisy input (flag=1)
if (flag == 0)
    block.Dwork(2).Data = mean_noise;
    
    
elseif (flag == 1)
    r= randn(1, simlen);
    R = (((r-mean(r)) ./ std(r)) .* std_noise) + mean_noise;
    block.Dwork(1).Data = R;
    block.Dwork(2).Data = block.Dwork(1).Data(block.Dwork(3).Data+1);
end
%endfunction


function Output(block)
block.OutputPort(1).Data = block.Dwork(2).Data;
%endfunction

function Update(block)

if (block.DialogPrm(4).Data==1)
    x= block.Dwork(3).Data;
    x=x+1;
    if (x>length(block.Dwork(1).Data))
        return;
    else
        
        block.Dwork(2).Data = block.Dwork(1).Data(x);
        block.Dwork(3).Data =  x;
    end
end
%endfunction

function Terminate(block)
%endfunction

%endfunction setup