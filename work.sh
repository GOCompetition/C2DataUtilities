#!/bin/sh

# override data selection
#case_dir=/pic/dtn/go/Steve/C2/sandbox/TAMU/Sep16/tgo500/tgo500_0010_5857/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/TAMU/Sep16/tgo500/tgo500_0010_5857/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/TAMU/Sep16/tgo10K/tgo10K_0060_7178/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Platform/Sep30_01/Sep30_TAMU01/tgo10K/tgo10K_0060_7178/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/Platform/Sep30_01/Sep30_TAMU01/tgo2000/tgo2000_0100_0289/
#/pic/projects/goc/submission-manager/submission-manager-tmp/arunveeramany/TESTSUB9_1_1/C2S3N00014_output1/

# C2DataUtilities test data
#case_dir=./test_data/ieee14/scenario_1/
#case_dir=./test_data/ieee14/scenario_2/
#case_dir=./test_data/ieee14/scenario_3/
#case_dir=./test_data/ieee14/scenario_4/
#case_dir=./test_data/ieee14/scenario_5/
#case_dir=./test_data/ieee14/scenario_6/
#case_dir=./test_data/ieee14/scenario_7/
#case_dir=./test_data/ieee14/scenario_8/
#case_dir=./test_data/ieee14/scenario_9/
#case_dir=./test_data/ieee14/scenario_10/
#case_dir=./test_data/ieee14/scenario_11/

# Originals
#case_dir=/pic/dtn/go/Jesse/C2N00014/scenario_02/

# sandbox
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N00014/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N00014/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N00594/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N00594/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N00594/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N00594/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N00594/scenario_005/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02000/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02000/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02000/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02000/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02000/scenario_005/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02044/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02044/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02044/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02044/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02380/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02380/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02380/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02380/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02380/scenario_005/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02742/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02742/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02742/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02742/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N02742/scenario_005/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N04225/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N04229/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N04229/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N04229/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N09459/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N09462/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N09462/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N11152/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N11152/scenario_002/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N11152/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N11152/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/C2S6N11152/scenario_005/

# trial 1
#case_dir=/pic/dtn/go/Steve/C2/T1/GT/industry/nonbase/MSR_BB/scenario_001/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/France-EHV-Lyon_BB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/France_NB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/MSR_BB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/MSR_NB/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_02R-173-tgo500_20190828/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_03R-200_S0700_20190923/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_25R-060_UW-LA2ND-24464_20191025/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_70R-422_S2000_20190625/scenario_1/
#case_dir=/pic/dtn/go/Steve/C2/T1/GaTech/Trial_1_Oct8/Network_70R-422_S2000_20190923/scenario_1/

# trial 1.5
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00030/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00031/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00032/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00033/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00034/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00035/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00036/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00037/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00030/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00031/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00032/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00033/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00034/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00035/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00036/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00037/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00038/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00039/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00001/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00002/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00004/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00005/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00006/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00007/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00008/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00010/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01010/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01011/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01012/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01013/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01014/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01015/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01016/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01017/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01018/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01019/

# ad hoc analysis
#case_dir=/people/holz501/gocomp/c2/data/UWMAD_GO2_AUS/
#case_dir=/people/holz501/gocomp/c2/data/TAMU_GOTx600_5002_0006/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial1/nov15_01/source/GOTx31K-0001/pop/GOTx31K_0001_9001/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/nov22_01/scrubbed/HVFLA/scenario_028/
#case_dir=/people/holz501/gocomp/c2/data/UWMAD_GO2/nov22_01/fix/HVFLA/scenario_029/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/nov22_01/scrubbed/GOTx2000_2001/scenario_049/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/nov24_01/UW/LTU44/scenario_001/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/nov24_01/UW/STV1/scenario_001/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/nov24_01/UW/AUS/scenario_007/
#case_dir=/people/holz501/gocomp/c2/data/UWMAD_GO2/AUSset1/AUSV1case01A
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial1/dec3_01/scrubbed/GOTx31K-0001/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/T1/Source/TAMU/GOTx31K-0001/scenario_003/
#case_dir=/pic/dtn/go/Steve/C2/T1/Source/GT/MSR_BB/scenario_244/
#case_dir=/pic/projects/goc/submission-manager/data//C2_Trial_1/C2T1N02312//scenario_254
#case_dir=/pic/projects/goc/submission-manager/data//C2_Trial_1/C2T1N00500//scenario_052
#case_dir=/pic/projects/goc/submission-manager/data//C2_Trial_1/C2T1N00403//scenario_222
#case_dir=/pic/projects/goc/submission-manager/data//C2_Trial_1/C2T1N00617/scenario_042/
#case_dir=/pic/projects/goc/submission-manager/data//C2_Trial_1/C2T1N15810/scenario_059
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_01_08_GOScen12k/GOTx12k_a00001/
#case_dir=/pic/projects/goc/submission-manager/data/C2_Trial_1/C2T1N00403/scenario_001/
#case_dir=/pic/projects/goc/submission-manager/data/C2_Trial_1/C2T1N15810/scenario_002/
#case_dir=/pic/projects/goc/submission-manager/data/C2_Trial_1/C2T1N04441/scenario_001/
#case_dir=/pic/projects/goc/submission-manager/data/C2_Trial_1/Network_09R-195_S5000_20190923/scenario_114/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/Source/TAMU/GOTx12k_v2/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/Source/TAMU/GOTx12k_v2/scenario_005/
#case_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/v2_Feb15/GOTx12k/GOTx12k_a00033/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/scrubbed/TAMU/GOTx12k_v2/scenario_004/
#case_dir=/pic/dtn/go/Steve/C2/sandbox/scrubbed/TAMU/GOTx12k_v2/scenario_005/
#case_dir=/pic/projects/goc/submission-manager/data/C2_Trial_1/C2T1N15810/scenario_016/
#case_dir=/people/holz501/gocomp/c2/data/carleton/2021-02-26/scenario_002/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/trial2/mar04_01/source/UW/smallMIOHIN/scenario_002/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/trial2/mar04_01/source/UW/HVMIOHIN/scenario_002/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/trial2/mar04_01/scrubbed/smallMIOHIN/scenario_002/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/trial2/mar04_01/scrubbed/HVMIOHIN/scenario_001/
#case_dir=/people/holz501/gocomp/c2/data/UWMAD_GO2/2021-03-04/team/
#case_dir=/people/holz501/gocomp/c2/data/UWMAD_GO2/2021-03-04/source/
#case_dir=/people/holz501/gocomp/c2/data/UWMAD_GO2/2021-03-04/scrubbed/
#HVMIOHIN
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_001/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_002/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_003/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_004/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_005/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_006/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_007/
#case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/TAMU/C2/trial2/feb17_01/scrubbed/pop/GOTx12k_v2/scenario_008/
case_dir=/pic/projects/goc/loadbalancing/src/challenge2-eval-repo/data/UWMAD_GO2/trial2/mar04_01/scrubbed/UW6/SOUTH14kSB/scenario_003/

#sol_dir=./tmpsol/sol7/
#sol_dir=/pic/projects/goc/submission-manager/submission-manager-tmp/llmagos/393-1607136894_c2t1_2/C2T1N00500_output52/
#sol_dir=/pic/projects/goc/submission-manager/submission-manager-tmp/llmagos/393-1607136894_c2t1_1/C2T1N02312_output254
#sol_dir=/pic/projects/goc/submission-manager/submission-manager-tmp/llmagos/393-1607136894_c2t1_2/C2T1N00500_output52
#sol_dir=/pic/projects/goc/submission-manager/submission-manager-tmp/llmagos/393-1607136894_c2t1_2/C2T1N00403_output222/
#grep Scenario: feasibility.log 
#       Scenario:/pic/projects/goc/submission-manager/data//C2_Trial_1/C2T1N02312//scenario_254
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_01_08_GOScen12k/GOTx12k_a00001/sol/
#sol_dir=./tmpsol/sol8/
#sol_dir=/pic/projects/goc/submission-manager/submission-manager-tmp/hhijazi/51-1612382444_1/C2T1N04441_output1/

#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00030/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00031/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00032/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00033/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00034/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00035/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00036/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx12k/GOTx12k_a00037/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00030/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00031/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00032/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00033/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00034/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00035/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00036/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00037/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00038/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx2000/GOTx2000_a00039/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00001/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00002/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00004/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00005/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00006/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00007/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00008/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx31k/GOTx31k_a00010/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01010/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01011/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01012/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01013/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01014/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01015/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01016/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01017/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01018/sol/
#sol_dir=/pic/dtn/go/Adam/Challenge2/2021_02_11_Trial1pt5/GOTx600/GOTx600_a01019/sol/
#sol_dir=/pic/projects/goc/submission-manager/submission-manager-tmp//llmagos/393-1607136894_c2t1_1//Network_09R-195_S5000_20190923_output114/
#sol_dir=/pic/projects/goc/submission-manager/submission-manager-tmp/hhijazi/51-1613861359_1/C2T1N15810_output16/
#sol_dir=/people/holz501/gocomp/c2/data/carleton/2021-02-26/scenario_002/
sol_dir=./test_data/ieee14/scenario_11/

# set options
strict_names=1
refresh_data=1
check_data=1
scrub_data=0
check_scrubbed_data=0
make_new_sol=0
copy_sol=0
eval_sol=0
do_submission=0
eval_submission=0
division=1
num_proc=1

py_dir=./data_utilities/
work_dir=./tmp/
raw1="${work_dir}/case.raw"
raw2="${work_dir}/case.scrubbed.raw"
sup1="${work_dir}/case.json"
sup2="${work_dir}/case.scrubbed.json"
con1="${work_dir}/case.con"
con2="${work_dir}/case.scrubbed.con"

echo "case: ${case_dir}"

if [ ! -d "$work_dir" ] 
then
    mkdir "$work_dir"
fi

# clean up the directory - todo just remove everything, right?
rm $work_dir/*.eval.log

# copy to here
if [ $refresh_data -gt 0 ]
then
    rm -rf $work_dir/*
    #rm $work_dir/*.raw
    #rm $work_dir/*.json
    #rm $work_dir/*.con
    if [ $strict_names -gt 0 ]
    then
	echo "find case: strict names"
	cp "${case_dir}case.raw" "$raw1"
	cp "${case_dir}case.json" "$sup1"
	cp "${case_dir}case.con" "$con1"
    else
	echo "find case: arbitrary names"
	cp "$case_dir"/*.raw "$work_dir"
	cp "$case_dir"/*.json "$work_dir"
	cp "$case_dir"/*.con "$work_dir"
        # remove the excess stuff
	rm $work_dir/*-w.raw
	rm $work_dir/*_clean.raw
	rm $work_dir/*_clean.json
	rm $work_dir/*_clean.con
	for i in $work_dir*.raw; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$raw1"
	done
	for i in "$work_dir"*.json; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$sup1"
	done
	for i in "$work_dir"*.con; do
	    [ -f "$i" ] || break
	    #echo "$i"
            cp "$i" "$con1"
	done
    fi
fi

# check data
if [ $check_data -gt 0 ]
then
    echo "check data"
    python ${py_dir}check_data.py "$raw1" "$sup1" "$con1"
else
    echo "skip check data"
fi

# scrub data
if [ $scrub_data -gt 0 ]
then
    echo "scrub data"
    python ${py_dir}scrub_data.py "$raw1" "$sup1" "$con1" "$raw2" "$sup2" "$con2"
else
    echo "skip scrub data"
    if [ $refresh_data -gt 0 ]
    then
	cp "$raw1" "$raw2"
	cp "$sup1" "$sup2"
	cp "$con1" "$con2"
    fi
fi

# check scrubbed data
if [ $check_scrubbed_data -gt 0 ]
then
    echo "check scrubbed data"
    python ${py_dir}check_data.py "$raw2" "$sup2" "$con2"
else
    echo "skip check scrubbed data"
fi

# construct infeasibility solution
if [ $make_new_sol -gt 0 ]
then
    echo "construct new infeasibility solution"
    rm ${work_dir}/solution_*.txt
    python ${py_dir}construct_infeasibility_solution.py "$raw2" "$sup2" "$con2" "$work_dir"
else
    echo "skip construct new infeasibility solution"
fi

# copy stored solution
if [ $copy_sol -gt 0 ]
then
    echo "copy stored solution"
    echo "stored solution directory: ${sol_dir}"
    cp ${sol_dir}/solution*.txt $work_dir
else
    echo "skip copy stored solution"
fi

# evaluate infeasibility solution
if [ $eval_sol -gt 0 ]
then
    echo "evaluate solution"
    if [ $num_proc -gt 1 ]
    then
	echo "using mpi, np=$num_proc"
	mpirun -np $num_proc python ${py_dir}evaluation.py $division "$work_dir" "$work_dir"
    else
	echo "using serial method"
	python ${py_dir}evaluation.py $division "$work_dir" "$work_dir"
    fi
else
    echo "skip evaluate solution"
fi

# do submission with infeasibility solution
if [ $do_submission -gt 0 ]
then
    echo "do submission with infeasibility solution"
    rm ./solution_*.txt
    reserved=reserved
    timelimit=300
    network=network
    python MyPython1.py "$con2" "$sup2" "$raw2" $reserved $timelimit $division $network
    python MyPython2.py "$con2" "$sup2" "$raw2" $reserved $timelimit $division $network
else
    echo "skip submission with infeasibility solution"
fi

# evaluate infeasibility solution
if [ $eval_submission -gt 0 ]
then
    echo "evaluate submission with infeasibility solution"
    if [ $num_proc -gt 1 ]
    then
	echo "using mpi, np=$num_proc"
	mpirun -np $num_proc python ${py_dir}evaluation.py $division "$work_dir" ./
    else
	echo "using serial method"
	python ${py_dir}evaluation.py $division "$work_dir" ./
    fi
else
    echo "skip evaluate submission with infeasibility solution"
fi


