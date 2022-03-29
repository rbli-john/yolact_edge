CUDA_VISIBLE_DEVICES=6 python3 eval.py \
    --disable_tensorrt \
    --trained_model=/nfs/AI/SegDepth/rongbin/model_pretrained/yolact_edge/yolact_edge_mobilenetv2_54_800000.pth \
    --image=sample_data/image_data/many_persons.jpg:output/many_persons_with_mark.jpg \
    --cuda=False
    # --video=sample_data/cat_48s_1.mp4:output/cat_48s_1_with_mark.mp4



# CUDA_VISIBLE_DEVICES=2 python3 eval.py \
#     --disable_tensorrt \
#     --trained_model=/nfs/AI/SegDepth/rongbin/model_pretrained/yolact_edge/yolact_edge_vid_resnet50_847_50000.pth
