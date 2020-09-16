## Welcome to HitDIC Documentation

This repository is used to release the usages for the latest version of HitDIC.

Currently, HitDIC on Windows is publicly available on [hitdic.com](https://hitdic.com). For Linux distributions, as well as HPC cluster with MPI support, please contact us for technical support.

### HitDIC Projects
A HitDIC project contains four parts,

- simulation.input
- database.input
- optimize.input
- src

The user should check the HitDIC project before considering further operations,
```
hitdiccheck
```

Other files and folders would be generated under the current project, when advanced HitDIC commands are executed, i.e., 
- .cache
- .workspace.json
- hitdic-restart.json

For detailed instruction, one refers to [HitDIC doc](hitdic-project.md).

### Simulation and Visualization

To simulate and visualize the initial project, one applies
```
hitdicplot
```
To simulate and plot the properties of diffusion couples using the latest optimization result, one append `--latest`, i.e.,
```
hitdicplot --latest
```

In case that interdiffusion fluxes and slopes of the diffusion couples are requested,
```
hitdicplot --full
```

Figure files will be restored in the `.cache` folder in the form of `svg`. One might visualize the result with browser. Other properties will also be serialized to `.csv` files as is located in the `.cache` folder.

List of the options for `hitdicplot`, can be queried with `hitdicplot -h`
```
Compiled at Mar 27 2020, 14:25:41
Plot figures in the HitDIC project
Usage:
  hitdicplot [OPTION...]

  -h, --help            Help
  -d, --debug           Enable debugging
      --with-solvent    Plot solvent together
      --opid arg        optimization id
      --comid arg       parameter combination id
      --flux            rendering flux
      --slope           rendering slope
      --conc            rendering composition
      --full            rendering all available properties
      --latest          use the latest optimization result
      --interd          rendering interdiffusion coefficients
  -c, --couplename arg  select the couples
      --src arg         source directory of the HitDIC project
      --thread arg      number of threads
      --test            evaluate the test set
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
*Note* The criterioon for parameter selection is set as `AICc` by default.

### Uncertainty quantification
The Metropolis-Hasting algorithm will be employed, while the `optimzie.input` has to be customized as 
```
[mcmc]
chainnumber = 10;
maxiter = 1000;
bounds = (default, -300, 300);
```

To activate the Metropolis-Hasting sampler,
```
hitdic-mcmc
```

To activate the Gibbs sampler
```
hitdic-mcmc --sampler=gibbs
```

### Simulation of diffusion multiple

Refer to [Simulation of diffusion multiple](hitdic2d.md)

### Examples

- [fcc CuAgSn](examples/cuagsn/readme.md)
- [fcc NiAlTa](examples/nialta/mcmc/readme.md)

### Reference

- [HitDIC Home](https://hitdic.com)
- [Jing Zhong, Weimin Chen and Lijun Zhang, HitDIC: A free-accessible code for High-throughput Determination of Interdiffusion Coefficients in single solution phase, CALPHAD, 60 (2018) 177-190.](https://doi.org/10.1016/j.calphad.2017.12.004)
- [Jing Zhong, Lijun Zhang, Xiaoke Wu, Li Chen and Chunming Deng, A novel computational framework for establishment of atomic mobility database directly from composition profiles and its uncertainty quantification. Journal of Materials Science & Technology. 2020 Mar 18.](https://doi.org/10.1016/j.jmst.2019.12.038)

### FAQs

#### Enable threading
One might add `--thread=2` to most of the command in the HitDIC toolkits. The number of threads can be customized according to the users, while 1 is used as default.

### Support or Contact

Having trouble with HitDIC? [Contact support](zhongjingjogy@gmail.com) and we’ll help you sort it out.
