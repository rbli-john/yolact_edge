import torch.nn as nn
from typing import Dict

from yolact_edge.yolact import Yolact

class YolactWrapper(nn.Module):
    def __init__(self, yolact_module: Yolact, extras: Dict):
        super().__init__()
        self.yolact_module = yolact_module
        self.extras = extras

    def forward(self, x):
        out_dict = self.yolact_module(x, extras=self.extras)['pred_outs'][0]
        # return order class, score, box, mask, proto
        return (out_dict['class'], out_dict['score'], out_dict['box'], out_dict['mask'], out_dict['proto'])