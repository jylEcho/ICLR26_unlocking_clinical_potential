# Unlocking Clinical Potential: Beyond Single-to-Tri-Phase CT with Dynamic Fusion for Precision Liver Tumor Segmentation  

### Pre-trained Weights  
The weights of the pre-trained MADF-Net in 1P、2P、3P comparative analysis could be downloaded [Here](https://drive.google.com/drive/folders/1FSgOOqEkdjfBTvYudSf9NAxIwG3CxWxW?usp=drive_link)  

## Datasets  
| Dataset | Phases       | Samples | Annotation Tool | Registration Method |  
|---------|--------------|---------|-----------------|---------------------|  
| MPLL    | Multi (ART/PV/DL) | 141   | ITK-SNAP        | B-spline            |  

<img src="https://github.com/jylEcho/test/blob/main/image/Dataset.png?raw=true" width="500">

## Contrast-Enhanced CT (CECT)： 

Contrast-enhanced CT (CECT), which captures dynamic tissue attenuation changes through contrast agent administration at different time points, offers a more informative alternative. It typically includes non-contrast (NC), arterial (ART), portal venous (PV), and delayed (DL) phases. These phases provide complementary information such as early vascular features, clear hepatic parenchyma structure, hyper-perfused regions, and delayed enhancement or washout effects, all of which help delineate lesion boundaries and improve segmentation accuracy. 

The complementary nature of these phases presents a valuable opportunity to improve segmentation performance through multi-phase fusion. 

## Existing Fusion Method： 

- **Input-Level Fusion: Concatenates arterial (ART), portal venous (PV), and delayed (DL) phase CT images.**
 
- **Feature-Level Fusion: Employs self-attention to dynamically weight phase-specific features.**

- **Decision-Level Fusion: Fuses predictions from individual phases and the fusion branch.**

## The existing fusion methods's shortcoming：

Treating each phase equally during fusion, failing to account for their clinical significance and complementary properties. This results in suboptimal performance, especially in scenarios with blurred lesion boundaries or small tumors.

## We achieved:

- **We conduct a comprehensive quantitative analysis of liver tumor segmentation across different CT phases and demonstrate the predominant contribution of the PV phase, providing both empirical and clinical insights.**

- **We propose MADF-Net, a multi-phase attention-based fusion network that integrates ART, PV, and DL phase features at multiple stages, enhancing liver tumor segmentation performance through deep inter-phase feature interaction.**

- **Extensive experiments on a benchmark dataset (MPLL) demonstrate that the proposed method achieves state-of-the-art liver tumor segmentation performance.**


## Experiments：Multi-Phase
- **一、 Multi-Phase Experiments：In the MPLL folder**

##  一、Multi-Phase Experiments

### Pre-trained Weights  
The weights of the pre-trained MADF-Net in 1P、2P、3P comparative analysis could be downloaded [Here](https://drive.google.com/drive/folders/1FSgOOqEkdjfBTvYudSf9NAxIwG3CxWxW?usp=drive_link)  

### Before Experiments：Create your conda environment

1、environments:Linux 5.4.0

2、Create a virtual environment: conda create -n environment_name python=3.8 -y and conda activate environment_name.

3、Install Pytorch : pip install torch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 --index-url https://download.pytorch.org/whl/cu117

4、Requirements:
numpy==1.14.2
torch==1.0.1.post2
visdom==0.1.8.8
pandas==0.23.3
scipy==1.0.0
tqdm==4.40.2
scikit-image==0.13.1
SimpleITK==1.0.1
pydensecrf==1.0rc3

### 1、Pre-process 

1.1  First run ./data_prepare/split.py for Data partition.

1.2  run ./data_prepare/generate_2D_train.py and data_prepare/generate_2D_test.py for period data processing, then you can see the result in ./processed/train and ./processed/test

### 2、Training Process

2.1  The model is trained by running ./bash/train_multiphase.sh (You can modify the hyperparameters as prompted.), and the weights of its runs are stored in the model_out folder， and you can download the model weights from the Google Drive link above, and if the link is broken, you can contact the corresponding author to obtain and update the URL.

### 3、Evalution

3.1  Run ./bash/evaluate.sh, replacing the training weights and test data addresses in evaluate.sh. The test results will be saved in the model_out folder for viewing.



