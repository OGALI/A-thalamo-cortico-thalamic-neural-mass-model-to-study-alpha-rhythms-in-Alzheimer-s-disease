%% CODE WRITTEN BY BASABDATTA SEN BHATTACHARYA AND IS A PROPERTY OF THE
%% UNIVERSITY OF ULSTER, NORTHERN IRELAND, UK. PLEASE CITE THE ARTICLE IN
%% WHICH THE WORK WAS FIRST PROPOSED WHEN USING THIS CODE. THE CITATION
%% DETAILS ARE AVAILABLE IN THE README.TXT FILE IN THIS FOLDER.
function mysigmoid_ver1(block)
%Simulating the sigmoid function in the model
setup(block);
%endfunction


function setup(block)
%% Dialog parameters are, in order, e0, r, s0.
block.NumDialogPrms = 3;
block.DialogPrmsTunable = {'Tunable','Tunable','Tunable'};
% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
%   block.InputPort(1).DatatypeID  = 0;  % double
%   block.InputPort(1).Complexity  = 'Real';

% Override output port properties
block.OutputPort(1).DatatypeID  = 0; % double
block.OutputPort(1).Complexity  = 'Real';

block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DirectFeedthrough = 1;
% says whether the input has (1) or hasn't (0) been used to calculate the output


block.OutputPort(1).Dimensions       =  1;

block.SampleTimes = [-1 0];% inherit those of the input

block.RegBlockMethod('Outputs', @Output);
block.RegBlockMethod('Terminate', @Terminate);



function Y = sigmoidfunc(x,e0,r,s0)
Y = 2*e0/(1 + exp(r*(s0-x)));
%endfunction


function Output(block)
x=block.InputPort(1).Data;
e0=block.DialogPrm(1).Data;
r=block.DialogPrm(2).Data;
s0=block.DialogPrm(3).Data;
block.OutputPort(1).Data = sigmoidfunc(x,e0,r,s0);
%endfunction

function Terminate(block)
%endfunction
%endfunction setup
