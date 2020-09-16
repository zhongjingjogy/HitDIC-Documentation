# Instruction on HitDIC project


## src: folder for experimental data

Experimental data refers to the observation of composition profiles measured from diffusion couple experiments. In HitDIC, all experimental data are stored in text format as columns. In case that there are many diffusion couples, one might have to put them in different files of text format and assign different names to those files.

- The experimental data should be placed under the `src` folder. 
- Data should arranged column by column
- The experimental data for different couples should be stored seperately in different folder.
- The unit for the distance is meter and at. is for the composition.

Taking the CuAgSn system as an example, data of six columns is expected
```
# distance (m)  Composition (at.)
# x(Sn)     c(Sn)       x(Ag)       c(Ag)       x(Cu)       c(Cu)
0.000000	0.018287	0.000000	0.000354	0.000000	0.981359
0.000039	0.017986	0.000039	0.000117	0.000039	0.981897
0.000077	0.018474	0.000077	0.000420	0.000077	0.981106
0.000155	0.017799	0.000155	0.000331	0.000155	0.981870
                           ...(omitted)...
0.001414	0.000385	0.001414	0.019870	0.001414	0.979745
0.001453	0.000371	0.001453	0.020151	0.001453	0.979478
0.001491	0.000459	0.001491	0.020125	0.001491	0.979416
0.001530	0.000532	0.001530	0.019605	0.001530	0.979863
```

## simulation.input: information of diffusion couples

Simulation input is used to specify the information of diffusion couples, i.e., composition of end members, annealing time, annealing temperature, length and Matano position and etc. Such information is the essential input for setting up the simulation conditions for the diffusion couples using the Fick’s second law.

|Keyword	    | Meaning	                                                | Example |
|---------------|-----------------------------------------------------------|---------|
|elements	    | Symbols of components in the Experimental data file.	| elements = Cu, Ag, Sn; |
|clefts	        | Compositions of the left end-member.	                | clefts = 0.018287, 0.000354, 0.981359; |
|crights	    | Compositions of the right end-member.	                | crights = 0.000532, 0.0195, 0.979863; |
|temperature	| Annealing temperture in Kelvin.	                        | temperature = 1073; |
|time	        | Annealing time in second.	                            | time = 129600; |
|length	        | Length of the diffusion couple.	                        | length = 0.001530013; |
|initpos	    | Matano position of the diffusion couple.	            | initpos = 0.000774005; |
|exppath	    | Path to the Experimental data (see Experimental data).	| exppath = 1sn.exp.0; |
|dbname	        | Tag to database parameters. (see Database input)	    | dbname = default; |

Labels have to be assigned in case that mutiple diffusion couples are available, while the name in the bracket can be customized according to the user.
```
[couple0]
elements = Sn, Ag, Cu;
clefts = 0.018287, 0.000354, 0.981359;
crights = 0.000532, 0.019605, 0.979863;
temperature = 1073;
time = 129600;
dbname = default;
exppath = src/1sn.exp.0;
length = 0.001530013;
initpos = 0.000774005;

[couple1]
elements = Sn, Ag, Cu;
clefts = 0.000567, 0.000279, 0.999154;
crights = 0.016315, 0.02748, 0.956841;
temperature = 1073;
time = 129600;
dbname = default;
exppath = src/1sn.exp.1;
length = 0.001324377;
initpos = 0.000741251;
```


## database.input: information of the kinetic description


Database input is used to stored the information of the thermodynamic parameters and atomic mobility parameters. Two kinds of parameters are to be stored in this file: thermodynamic parameters and atomic mobility parameters. To specify the database information, one have to follow the CALPHAD notion.

A block for the database description for a phase should be begin with a tag to be used in Simulation input.
```
[default]
 PARAMETER G(FCC,AG,CU;0) 298.15  +36061.88-10.44288*T; 3000 N !
 PARAMETER G(FCC,AG,CU;1) 298.15  -4310.12; 3000 N !
 PARAMETER G(FCC,AG,SN;0) 298.15  +745.45+11.498027*T; 3000 N !
 PARAMETER G(FCC,AG,SN;1) 298.15  -36541.5; 3000 N !
 PARAMETER G(FCC,CU,SN;0) 298.15  -11106.95+2.07910*T; 3000 N !
 PARAMETER G(FCC,CU,SN;1) 298.15  -15718.02+5.92467*T; 3000 N !

 PARAMETER MQ(FCC&AG,AG;0) 298.15  -175892-93.5*T; 3000 N !
 PARAMETER MQ(FCC&AG,CU;0) 298.15  -191533-82.93*T; 3000 N !
 PARAMETER MQ(FCC&AG,SN;0) 298.15  -59345-85.3578*T; 3000 N !
 PARAMETER MQ(FCC&CU,AG;0) 298.15  -179012-87.49*T; 3000 N !
 PARAMETER MQ(FCC&CU,CU;0) 298.15  -205872-82.52*T; 3000 N !
 PARAMETER MQ(FCC&CU,SN;0) 298.15  -59345-85.3578*T; 3000 N !
 PARAMETER MQ(FCC&SN,AG;0) 298.15  -166245.24-86.8*T; 3000 N !
 PARAMETER MQ(FCC&SN,CU;0) 298.15  -1.72907082E+05-9.17770478E+01*T; 3000 N !
 PARAMETER MQ(FCC&SN,SN;0) 298.15  -59345-85.3578*T; 3000 N !

 PARAMETER MQ(FCC&AG,AG,CU;0) 298.15  A0; 3000 N !
 PARAMETER MQ(FCC&AG,AG,SN;0) 298.15  A1; 3000 N !
 PARAMETER MQ(FCC&AG,CU,SN;0) 298.15  A2; 3000 N !
 PARAMETER MQ(FCC&CU,AG,CU;0) 298.15  A3; 3000 N !
 PARAMETER MQ(FCC&CU,AG,SN;0) 298.15  A4; 3000 N !
 PARAMETER MQ(FCC&SN,AG,CU;0) 298.15  A5; 3000 N !
 PARAMETER MQ(FCC&SN,AG,SN;0) 298.15  A6; 3000 N !
```


### Unknown parameters for Database input


In order to achive better fitting result in the optimization module (hitdicop). In HitDIC, the unknown parameters should be denoted with specific prefix, i.e., A and B. Unknown parameters with prefix A means that such a parameter has no dependency on temperature. Unknown parameters with prefix B means that such a parameter has dependency on temperature. 

*Important* In this example, four unknowns have been specified, i.e, A0, A1, B0, B1. This is a design in HitDIC, which can be used to choose the best strategy for estimating the initial values for different optimization algorithms in hitdicop. For unknown parameters with prefix, A, the default ranges of such parameters are set to be -300000 ~ 300000, while -300 ~ 300 is set to be that of paramters with prefix, B.

## optimization input: settings for the minimizer

A set of algorithms have been specified in HitDIC, which can be assessed from hitdicop. This input file is designed in order to modify the default settings.



### Markov chain Monte Carlo

|Options	   | Meaning	                                        | Example |
|--------------|----------------------------------------------------|----------|
|maxiter	   | Maximum iterations to be executed.	            | maxiter = 2000; |
|bounds	   | Boundary values of unknowns.	                | bounds = (A0, -300000, 300000), (B0, -300, 0); |
|alpha	   | Scaling factors for the probability.	        | alpha = 0.5; |
|sigma	   | Estimated variance of the experimental noise.	| sigma = 0.1; |
|variance	|Maximum spacing of the random walk.	            | variance = 5.0; |
|mcmclog	   | Log file.	                                    | mcmclog = mcmclog.log; |
|chainnumber   | Number of chains to be executed                | chainnumber = 10; |
|guess         | Specify the restart file for HitDIC.           | guess = hitdic-restart.json; |

```
[mcmc]
maxiter = 10000;
chainnumber = 11;
bounds = (default, -300, 300);
```

## Variable selection genetic algorithm


|Options	   | Meaning	                                        | Example |
|--------------|----------------------------------------------------|----------|
|maxiter	   | Maximum iterations to be executed.	            | maxiter = 150; |
|bounds	   | Boundary values of unknowns.	                | bounds = (A0, -300000, 300000), (B0, -300, 0); |

```
[varselga]
maxiter = 500;
bounds = (default, -1000, 0);
```