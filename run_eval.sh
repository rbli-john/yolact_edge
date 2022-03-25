CUDA_VISIBLE_DEVICES=1 python3 eval.py \
    --disable_tensorrt \
    --trained_model=/nfs/AI/SegDepth/rongbin/model_pretrained/yolact_edge/yolact_edge_mobilenetv2_54_800000.pth




# CUDA_VISIBLE_DEVICES=2 python3 eval.py \
#     --disable_tensorrt \
#     --trained_model=/nfs/AI/SegDepth/rongbin/model_pretrained/yolact_edge/yolact_edge_vid_resnet50_847_50000.pth
