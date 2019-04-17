# A thalamo-cortico-thalamic neural mass model to study alpha rhythms in Alzheimer's disease

## Abstract
A lumped computational model of the thalamo–cortico–thalamic circuitry is simulated in this work. The model essentially consists of two modules: a thalamic module and a cortical module. The thalamic module circuitry is a modified version of the thalamic circuitry which is a classical neural mass computational model that has been used countless times in the literature to simulate cortical alpha rhythms and measure EEG abnormality associated with Alzheimer’s Disease (AD). What is novel here is that a modified synaptic structure representing a neuronal population in the thalamic model is connected to a cortical module circuitry that is based on a recent work studying cortical brain rhythms. Furthermore, the synaptic organization and connectivity parameter in the thalamic module are based on experimental data reported from the Dorsal Lateral Geniculate Nucleus (LGDd) of different species. Only the synaptic connectivity parameters in the thalamic module of the model are varied to simulate the effects of AD on brain synaptic circuitry and study power within the alpha frequency bands. The power and dominant frequencies of the model output are studied in three sub-bands within the alpha band: lower alpha (7–9 Hz), middle alpha (9–11 Hz) and upper alpha (11–13 Hz). Such an analytical method conforms to recent comparative EEG studies on young adults, healthy aged adults and MCI or early-stage AD patients. The results show a remarkable role of the synaptic connectivities in the inhibitory thalamic cell populations on the alpha band power and frequency. Furthermore, the total number of active synapses in the thalamic cell populations produces the slowing of alpha rhythms and a simultaneous decrease of alpha band power in the brain as a result of AD.

## To execute raw  the model:

1) Clone the repository on your computer (press on green button "Clone or download" -> "Download Zip")

2) Unzip the folder and open the "SimulinkModels" folder. Any *.mdl file represents and Simulink model for a particular scenario.


3) Open the "basab_thalamocorticothalamicCkt.mdl" which represents the baseline for healthy individuals (the file should open Simulink).

3) Run the model by clicking on the 'Play' button on the Simulink
window. You will notice variables appear in your Matlab workspace; they represent the model output.


## To obtain the plots from the model:

1) open the main.m file and run the script; it will use data from runs that were simulated on my computer to do the plots (data located in precompiledRuns/).

Note: use the option "Run Section" when running the script
## Author
* **Ali Najmaldin**

## Acknowledgments
This model is based on:

[1] Sen Bhattacharya, Basabdatta, Coyle, Damien, Maguire, Liam: "A
thalamo-cortico-thalamic neural mass model to study alpha rhythms in
Alzheimer's disease", Neural Networks (2011),
doi:10.1016/j.neunet.2011.02.009.
