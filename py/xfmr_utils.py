
def compute_xfmr_position(r):
    if r.cod1 == 0:
        position = 0
        oper_val = 0.0
        oper_val_realized = 0.0
        resid = 0.0
        mid_val = 0.0
        step_size = 0.0
        max_position = 0
    else:
        mid_val = 0.5 * (r.rma1 + r.rmi1)
        step_size = (r.rma1 - r.rmi1) / (r.ntp1 - 1.0)
        max_position = int(round(0.5 * (r.ntp1 - 1.0)))
        if r.cod1 in [-1, 1]:
            oper_val = r.windv1 / r.windv2
        elif r.cod1 in [-3, 3]:
            oper_val = r.ang1
        else:
            print('data error: transformer cod1 allowable values: [-3, -1, 0, 1, 3], actual value: {}'.format(r.cod1))
            raise Exception
        position = round((oper_val - mid_val) / step_size)
        if position > max_position:
            position = max_position
        elif position < -max_position:
            position = -max_position
        oper_val_realized = mid_val + step_size * position
        resid = oper_val - oper_val_realized
    return (position, oper_val, oper_val_realized, resid, mid_val, step_size, max_position)
