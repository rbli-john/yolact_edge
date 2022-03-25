from yolact_edge.yolact import Yolact
import torch


if __name__ == '__main__':
    net = Yolact(training=False)
    net.load_weights('/nfs/AI/SegDepth/rongbin/model_pretrained/yolact_edge/yolact_edge_mobilenetv2_54_800000.pth')
    print('Loaded weighted')

    torch.save(net, 'output/yolact_edge_mobilenetv2_full_model.pt')
    print('Saved model to file')
