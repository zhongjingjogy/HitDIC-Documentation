### Simulation of diffusion multiple

Command for simulation of diffusion multiple,
```
hitdic2dplot
```

Two files are needed as input, i.e., `hitdic.block` and `database.input`.

#### `hitdic.block`

```
[common]                        # mandatory placer holder, specify the matrix
components = AA, BB;            # lists of components
dx = 1.0e-4;                    # space step
maxdt = 2000.0;                 # max time step allowed
temperature = 1453;             # temperatures for the system
time = 362880.0;                # annealing times of the diffusion couple
region = 0, 0, 200e-5, 200e-5;  # coordinates of the diffusion multiple
composition = 0.01, 0.99;       # composition of the matrix

[region1]                              # custom name of the a block in a diffusion multiple
region = 50e-5, 50e-5, 150e-5, 150e-5; # coordinates of the block
composition = 0.05, 0.95;              # composition of the block

# More blocks can be added using costom blocks
```

Note: For the coordinates of the `block`, it reads as `x_lower, y_lower, x_upper, y_upper`.

#### `database.input`
The settings for this input is similar to that of HitDIC. Specially, the name of the database must be assign as `default`.
```
[default]                     # Mandatory
MQA_A0 = -97.34*T-223111.6;
MQA_B0 = -97.34*T-223111.6;
MQB_A0 = -97.34*T-223111.6;
MQB_B0 = -97.34*T-223111.6;
```

#### Results

![Diffusion multiple simulation](examples/multiple2d/hypothetical.png)