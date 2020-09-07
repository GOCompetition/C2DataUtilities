from data_json import Sup
from data import Data
from pathlib import Path
import os
import sys
import numpy as np

class Evaluation:

    
    gen_pow_real = { 511: -2  }
    gen_status = { 511: 1 }
    num_gen = 512

    def __init__(self):
        self.data = Data()
      
        data_path = 'C:/Arun/Grid/GOC/Challenge2/Evaluation/data/Network_06O-124-tgo2000_20190828/scenario_33'
        self.data.sup.read( Path(data_path) / "case.json")
        self.data.sup.convert_generator_cblock_units(1)

    def eval_cost(self):
        self.gen_cost = np.zeros(self.num_gen)
        for generator in self.data.sup.generators.values():
            k = generator['bus']
            if k not in self.gen_pow_real:
                continue
            sx = self.gen_pow_real[k]
            if self.gen_status[k] == 0.0:
                continue
            pmax_sum = 0.0  #this is x_i
            self.gen_cost[k] = 0.0
            block_cost = 0.0    #cost of last block  
            for cblock in generator['cblocks']: 
                block_cost = cblock['c']
                if sx <= pmax_sum + cblock['pmax']:
                    break
                else:
                    self.gen_cost[k] += cblock['pmax'] * block_cost
                pmax_sum += cblock['pmax']
            residual_pmax = (sx - pmax_sum) #works whether sx is inside a block or outside all blocks
            self.gen_cost[k] += residual_pmax * block_cost


    def test_gen_cost(self):
        self.eval_cost()
        print(self.gen_cost[511])

Evaluation().test_gen_cost()