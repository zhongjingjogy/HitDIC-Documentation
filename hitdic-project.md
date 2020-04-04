## Instruction on preparing the HitDIC project

### Experimental data

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

### simulation.input

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

### database.input

Database input is used to stored the information of the thermodynamic parameters and atomic mobility parameters. Two kinds of parameters are to be stored in this file: thermodynamic parameters and atomic mobility parameters. To specify the database information, one have to follow the simplified markup rules in HitDIC, which is used to tranlate the thermodynamic and atomic mobility database parameters into the notation for HitDIC.

#### From Periodic Symbol to Alphabatic Symbol

In order to convert the CALPHAD notation into HitDIC notation, the Periodic Symbol should be translated into Alphabatic Symbol. This means the user has to sorted the elements mannually according to their Periodic Symbols.

**Cu, Ag, Sn –> Ag, Cu, Sn**

And thus,

|Periodic Symbol	| Alphabatic Symbol |
|-------------------|-------------------|
|Cu	| B |
|Ag	| A |
|Sn	| C |

#### From CALPHAD notation to HitDIC notation

With the convertion rule above, the parameter denoted by CALPHAD notation can now be translated into HitDIC notation.

| CALPHAD Notation	| HitDIC Notation	| Example |
|-------------------|-------------------|-----------|
| G(FCC,Ag,Cu;0)	        | GAB0	            | GAB0 = +36061.88-10.44288*T; |
| G(FCC,Ag,Cu;1)	        | GAB1	            | GAB1 = -4310.12; |
| G(FCC,Ag,Sn;0)	        | GAC0	            | GAC0 = +745.45+11.498027*T; |
| G(FCC,Ag,Sn;1)	        | GAC1	            | GAC1 = -36541.5; |
| G(FCC,Cu,Sn;0)	        | GBC0	            | GBC0 = -11106.95+2.07910*T; |
| G(FCC,Cu,Sn;1)	        | GBC1	            | GBC1 = -15718.02+5.92467*T; |

*Note* Contribution from magnetic ordering to Gibbs energy can also be considered by using the HitDIC notation of TC and BMAGN.

|CALPHAD Notation	|HitDIC Notation|	Example|
|-------------------|----------------|----------|
|End-members	 	 |              |           |
|MQ(FCC&Ag,Ag;0)	          |  MQA_A0	     |   MQA_A0 = -175892-93.5*T;|
|MQ(FCC&Cu,Ag;0)	          |  MQA_B0	     |   MQA_B0 = -191533-82.93*T;|
|MQ(FCC&Sn,Ag;0)	          |  MQA_C0	     |   MQA_C0 = -59345-85.3578*T;|
|MQ(FCC&Ag,Cu;0)	          |  MQB_A0	     |   MQB_A0 = -205872-82.52*T;|
|MQ(FCC&Cu,Cu;0)	          |  MQB_B0	     |   MQB_B0 = -179012-87.49*T;|
|MQ(FCC&Sn,Cu;0)	          |  MQB_C0	     |   MQB_C0 = -59345-85.3578*T;|
|MQ(FCC&Ag,Sn;0)	          |  MQC_A0	     |   MQC_A0 = -166245.24-86.8*T;|
|MQ(FCC&Cu,Sn;0)	          |  MQC_B0	     |   MQC_C0 = -59345-85.3578*T;|
|MQ(FCC&Sn,Sn;0)	          |  MQC_C0	     |   MQC_B0 = -1.72907082E+05-9.17770478E+01*T;|
|Interactions	 	   |                     |                              |
|MQ(FCC&Ag,Cu,Ag;0)	       | MQA_AB0	     |   MQA_AB0 = 100190.00136125;|
|MQ(FCC&Ag,Sn,Ag;0)	       | MQA_AC0	     |   MQA_AC0 = -195245.22880078;|
|MQ(FCC&Cu,Sn,Ag;0)	       | MQA_BC0	     |   MQA_BC0 = 160022.98017274;|
|MQ(FCC&Ag,Cu,Cu;0)	       | MQB_AB0	     |   MQB_AB0 = -200212.73084957;|
|MQ(FCC&Cu,Sn,Cu;0)	       | MQB_BC0	     |   MQB_BC0 = -200026.69215919;|
|MQ(FCC&Ag,Sn,Cu;0)	       | MQB_AC0	     |   MQB_AC0 = -200004.82397301;|
|MQ(FCC&Ag,Sn,Sn;0)	       | MQC_AC0	     |   MQC_AC0 = -207551.89564001;|
|MQ(FCC&Cu,Sn,Sn;0)	       | MQC_BC0	     |   MQC_BC0 = 40218.25749531;|
|MQ(FCC&Ag,Cu,Sn;0)	       | MQC_AB0	     |   MQC_AB0 = 216953.04097880;|

Here comes the example for writing the database input file for HitDIC. A block for the database description for a phase should be begin with a tag to be used in Simulation input.
```
[default]
GAB0 = +36061.88-10.44288*T;
GAB1 = -4310.12;
GAC0 = +745.45+11.498027*T;
GAC1 = -36541.5;
GBC0 = -11106.95+2.07910*T;
GBC1 = -15718.02+5.92467*T;
MQA_A0 = -175892-93.5*T;
MQA_B0 = -191533-82.93*T;
MQA_C0 = -59345-85.3578*T;
MQB_B0 = -205872-82.52*T;
MQB_A0 = -179012-87.49*T;
MQB_C0 = -59345-85.3578*T;
MQC_A0 = -166245.24-86.8*T;
MQC_C0 = -59345-85.3578*T;
MQC_B0 = -1.72907082E+05-9.17770478E+01*T;
MQA_AB0 = 100190.00136125;
MQA_AC0 = -195245.22880078;
MQA_BC0 = 160022.98017274;
MQB_AB0 = -200212.73084957;
MQB_BC0 = -200026.69215919;
MQB_AC0 = -200004.82397301;
MQC_AC0 = -207551.89564001;
MQC_BC0 = 40218.25749531;
MQC_AB0 = 216953.04097880;
```

#### Unknown parameters for Database input
In order to achive better fitting result in the optimization module (hitdicop). In HitDIC, the unknown parameters should be denoted with specific prefix, i.e., A and B. Unknown parameters with prefix A means that such a parameter has no dependency on temperature. Unknown parameters with prefix B means that such a parameter has dependency on temperature. An example can be used to illustrate how the unknowns are specified:

```
[default]
MQA_A0 = -190000;
MQA_B0 = -190000;
MQB_A0 = -185000;
MQB_B0 = -185000;

MQA_AB0 = A0 + B0*T;
MQB_AB0 = A1 + B1*T;
```

*Important* In this example, four unknowns have been specified, i.e, A0, A1, B0, B1. This is a design in HitDIC, which can be used to choose the best strategy for estimating the initial values for different optimization algorithms in hitdicop. For unknown parameters with prefix, A, the default ranges of such parameters are set to be -300000 ~ 300000, while -300 ~ 300 is set to be that of paramters with prefix, B.


### Optimization input
A set of algorithms have been specified in HitDIC, which can be assessed from hitdicop. This input file is designed in order to modify the default settings.

#### Markov chain Monte Carlo
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

#### Variable selection genetic algorithm
|Options	   | Meaning	                                        | Example |
|--------------|----------------------------------------------------|----------|
|maxiter	   | Maximum iterations to be executed.	            | maxiter = 150; |
|bounds	   | Boundary values of unknowns.	                | bounds = (A0, -300000, 300000), (B0, -300, 0); |

```
[varselga]
maxiter = 500;
bounds = (default, -1000, 0);
```