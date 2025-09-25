

#cd ..
python  ./evaluate/evaluate.py \
--is_savenii \
--module \
networks.your_python_file_name.your_python_class_name \
--checkpoint \
/path to your .pth weight file \
--dataset \
Multiphase \
--crop_inference \
standard_crop_inference \
--test_path \
/path to your test data \
--gpu \
0
