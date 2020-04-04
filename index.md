## Welcome to HitDIC Documentation

HitDIC is a powerful but free-accessible software for automating the procedures to retrieve the composition-dependent interdiffusion coefficient matrices for systems with any numbers of components based on the original experimental composition profiles using the numerical inverse method, developed by Prof. Lijun Zhang's group at Central South University, P.R. China.

This repository is used to release the usages for the latest version of HitDIC.

Ref. 1 [HitDIC Home](https://hitdic.com)
Ref. 2 [Jing Zhong, Weimin Chen and Lijun Zhang, HitDIC: A free-accessible code for High-throughput Determination of Interdiffusion Coefficients in single solution phase, CALPHAD, 60 (2018) 177-190.](https://doi.org/10.1016/j.calphad.2017.12.004)
Ref. 3 [Jing Zhong, Lijun Zhang, Xiaoke Wu, Li Chen and Chunming Deng, A novel computational framework for establishment of atomic mobility database directly from composition profiles and its uncertainty quantification. Journal of Materials Science & Technology. 2020 Mar 18.](https://doi.org/10.1016/j.jmst.2019.12.038)

Currently, HitDIC on Windows is publicly available on [hitdic.com](https://hitdic.com). For Linux distributions, as well as HPC cluster with MPI support, please contact us for technical support.

### HitDIC Projects
A HitDIC project contains four parts,

- simulation.input
- database.input
- optimize.input
- src

Other files and folders would be generated under the current project, when advanced HitDIC commands are executed, i.e., 
- .cache
- .workspace.json
- hitdic-restart.json

For detailed instruction, one refers to [HitDIC doc](https://docs.hitdic.com/usage/project/project.html).

### Simulation and Visualization

The user should check the HitDIC project before considering further operations,
```
hitdiccheck
```

To simulate and visualize the initial project, one applies
```
hitdicplot
```
or 
```
hitdicplot --couplename=couplename
```

In case that interdiffusion fluxes and slopes of the diffusion couples are requested,
```
hitdicplot --full
```

### Parameter Selection and Parameter Estimation
The variable selection genetic algorithm will be employed in this option. The `optimize.input` has to be customized 
```
[varselga]
maxiter = 250;
bounds = (default, -300, 300);
```
To activate the varselga algorithm,
```
hitdic-ga
```

### Uncertainty quantification
The Metropolis-Hasting algorithm will be employed, while the `optimzie.input` has to be customized as 
```
[mcmc]
chainnumber = 10;
maxiter = 1000;
bounds = (default, -300, 300);
```

To run the mcmc module,
```
hitdic-mcmc
```

### Examples

- fcc CuAgSn

### FAQs

#### Enable threading
One might add `--thread=2` to most of the command in the HitDIC toolkits. The number of threads can be customized according to the users, while 1 is used as default.

### Support or Contact

Having trouble with HitDIC? [contact support](zhongjingjogy@gmail.com) and we’ll help you sort it out.
