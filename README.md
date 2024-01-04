# Inverter-Characterization-Pre-Layout-and-Post-Layout-
Detailed analysis and parameter calculation of the COMS inverter.  

# Inverter-pre-layout-Design
Inverter characteristics realization using Open Source tools. 

**The inverter is the nucleus of all digital designs.** The analysis of inverters can be extended to explain the behaviour of more complex gates such as NAND, NOR, or XOR, which in turn form the building blocks for modules such as multipliers and processors.

This analysis provides a gate model that will help us identify the gate's parameters and select their values such that the final model corresponds to the required specifications. While each of these factors is equally observable for a specific technology, I also explain how they are influenced by technological scalability.

![Screenshot from 2023-08-18 15-07-22](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/b73a8a1d-00f5-48bb-a3a7-09bc55f83741)


The schematic symbol of the inverter is displayed in the image above. The inverter requires two MOS transistors: one PMOS and one NMOS. VDD has been coupled to the source of PMOS, the drain of PMOS and the drain of the NMOS are shorted from where the output would be taken, and the source of the NMOS is connected to the ground. The gates of the PMOS and NMOS are connected together, and they act as the inverter's input. 

The C_Load illustrates the inverter's all-load capacitance, comprising all capacitance connected with the transistors. which can be observed in the images below.
CMOS capacitances:

```
Gate-Drain Capacitance 
  𝐶_𝑔𝑑=2 𝐶_𝐺𝐷0 𝑊

Diffusion Capacitance
  𝐶_𝑒𝑞=𝐾_𝑒𝑞 𝐶_𝑗0  

Wring Capacitance
  𝐶_𝑤

Fanout Capacitance 
  𝐶_𝑓𝑎𝑛𝑜𝑢𝑡=𝐶_𝑔𝑎𝑡𝑒  (𝑁𝑀𝑂𝑆)+𝐶_𝑔𝑎𝑡𝑒  (𝑃𝑀𝑂𝑆)
  𝐶_𝑓𝑎𝑛𝑜𝑢𝑡=(𝐶_𝐺𝑆𝑂𝑛+𝐶_𝐺𝐷𝑂𝑛+𝑊_𝑛 𝐿_𝑛 𝐶_𝑜𝑥 )+(𝐶_𝐺𝑆𝑂𝑝+𝐶_𝐺𝐷𝑂𝑝+𝑊_𝑝 𝐿_𝑝 𝐶_𝑜𝑥 )
```


## MOS Inverter – Static behaviour
+ Full voltage swing 
+ Ratio less logic level 
+ No floating node at the output side 
+ High input impedance (Gate is a virtually perfect insulator)
+ Low output impedance (resistance in the range of 𝑘Ω)
+ No static power consumption 
+ High noise margin 


## VTC

The nature and the form of the voltage-transfer characteristic (VTC) can be graphically deduced by superimposing the current characteristics of the NMOS and the PMOS devices. Such a graphical construction is traditionally called a load-line plot. It requires that the I-V curves of the NMOS and PMOS devices are transformed into a common coordinate set. 

![Asset 1](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/1309a581-e23f-4c20-be87-82f0412bf1df)

```
For the above curve, DC simulation is used.

############# Parameters #############
VDD = 1.8v
GND = 0v

PMOS
  width = 1
  height = 0.15

NMOS 
  width = 1
  height = 0.15
######################################

-> meas dc vm when vin=vout 
vm                  =  8.380288e-01

```

The resulting load lines are plotted in Figure For a DC operating point to be valid, the currents through the NMOS and PMOS devices must be equal. Graphically, this means that the dc points must be located at the intersection of corresponding load lines. This results from the high gain during the switching transient, when both NMOS and PMOS are simultaneously on, and in saturation. In that operation region, a small change in the input voltage results in a large output variation. All these observations translate into the VTC of Figure.

The switching threshold, VM, is defined as the point where Vin = Vout. Its value can be obtained graphically from the intersection of the VTC with the line given by Vin = Vout

![image](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/614428da-51f8-4363-885e-446a80d040b1)


It is generally considered to be desirable for VM to be located around the middle of the available voltage swing (or at VDD/2), since this results in comparable values for the low and high noise margins. This requires r to be approximately 1. Moving the VM upwards requires sizing the PMOS device. A larger value of r is
required, which makes the PMOS wider. that represented below.

![P increase](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/10a3b5ca-31ae-43d8-b589-83137dd5bcf8)

Increasing the strength of the NMOS, on the other hand, moves the switching threshold closer to GND. as shown below

![N increase](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/a9d7bbc5-3794-4807-be15-087bbdb5cd3d)

this way, we can derive the required ratio of PMOS versus NMOS transistor sizes such that the switching threshold is set to a desired value VM.

```
Here, the Height of the PMOS and NOMS is fixed but the width is increased, corresponding VM values are mentioned below:

=================================
|  WP |  WN |      VM values    |
=================================
|  2  |  1  |    8.698292e-01   |
---------------------------------
|  3  |  1  |    8.930940e-01   |
---------------------------------
| 3.5 |  1  |    8.998695e-01   |
---------------------------------
|  4  |  1  |    9.058112e-01   |
---------------------------------
|  5  |  1  |    9.158917e-01   |
---------------------------------
|  1  |  2  |    7.850218e-01   |
---------------------------------
|  1  |  3  |    7.596171e-01   |
---------------------------------

WP = Width of PMOS.
WN = Width of NMOS.
HP = Height of PMOS = 0.15.
HP = Height of NOMS = 0.15.
```

**To get a symmetrical zero-to-one or one-to-zero transition we keep the width of POMS 2 to 3 times larger than the width of NOMS.** 

## Noise Margine analysis
The noise margin in VLSI is the amount of noise that a CMOS circuit can endure without interfering with its function.  By definition, VIH and VIL are the operational points of the inverter where dVout/dVin = -1. 

There are two main types of noise margins in VLSI design: the noise margin for a logic high (NMH) and the noise margin for a logic low (NML). NMH is the difference between the minimum voltage level for a logic high and the maximum voltage level for a logic low. That is, both NMH and NML can be expressed as follows.

NMH = VOH − VIH
NML = VIL − VOL

VIH (high-level input voltage) is the minimum high input voltage to be recognized as logic 1.
VIL (low-level input voltage) is the maximum low input voltage to be recognized as logic 0.
VOH (high-level output voltage) is the minimum high output voltage when the output is logic 1.
VOL (low-level output voltage) is the maximum low output voltage when the output is logic 0.

![Asset 9](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/5389d359-c821-4ab9-baa3-c2e235c539e8)

With a CMOS inverter, VOH equals VDD and VOL equals the ground potential.

![Asset 17](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/afe93de3-31f6-45ab-bd5e-9ee88d686cb1)

```
############# Parameters #############
VDD = 1.8v
GND = 0v

PMOS
  width = 3
  height = 0.15

NMOS 
  width = 1
  height = 0.15
######################################

-> meas vil dc find vin when gain=1 cross=1   
dc                  =  7.659556e-01

-> meas vih dc find vin when gain=1 cross=last
dc                  =  1.018544e+00

here, 
	vil is = 0.76595
	vih is = 1.8 - 1.01854 = 0.78146 
	
vil ~ vih	because we have PMOS w = 3 

Ideally vil = vih but due to area constraints there is a limit

```

In practice, the noise margin in VLSI is the amount of noise that a logic circuit can endure. Positive noise margins ensure correct operation, whereas negative noise margins result in impaired functioning or outright failure. 

## Propagation delay
The qualitative study provided earlier indicated that the CMOS inverter propagation delay is governed by the time it takes to charge and discharge the load capacitor CL via the PMOS and NMOS transistors, respectively. This fact implies that obtaining CL as little as feasible is critical for realising high-performance CMOS devices. 

![propo](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/821ee9a5-70e9-44bf-becd-b702d58d5193)

Propagation delay is normally described as the time difference between when the transitional input reaches 50% of its final value and when the output reaches 50% of its final value. This demonstrates the influence of input change. In this case, 50% is defined as the logic threshold at which output (or, more specifically, any signal) is presumed to flip states. 

The propagation delay of a logic gate is not constant and is determined by two factors:

1. Input transition time causes output transition: The longer the transition time at the input, the longer the cell’s propagation delay. Signals should transition quicker to reduce propagation delays.

2. Output load of the logic gate: The greater the capacitive load at the cell’s output, the greater the effort (time required) to charge it. As a result, the propagation latency increases.

![Asset 13](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/68af336f-cd24-40dd-b351-44b5774a1afd)

```
# value="PULSE(0 1.8 0 0.3NS 0.3NS 4NS 8.6NS 4)"

-> meas tran vin50 when vin=0.9 RISE=2
vin50               =  8.750000e-09

-> meas tran vout50 when vout=0.9 FALL=2
vout50              =  8.780251e-09

-> let tpHL = vout50 - vin50
-> print tpHL
tphl = 3.025100e-11


-> meas tran vin50 when vin=0.9 FALL=2
vin50               =  1.305000e-08

-> meas tran vout50 when vout=0.9 RISE=2
vout50              =  1.307935e-08

-> let tpLH = vout50 - vin50
-> print tpLH 
tplh = 2.935000e-11

#######################################################

# value="PULSE(0 1.8 0 0.1NS 0.1NS 4NS 8.2NS 4)"

-> meas tran vin50 when vin=0.9 RISE=2
vin50               =  8.250000e-09

-> meas tran vout50 when vout=0.9 FALL=2
vout50              =  8.273712e-09

-> let tpHL = vout50-vin50  
-> print tpHL
tphl = 2.371200e-11


-> meas tran vin50 when vin=0.9 FALL=2
vin50               =  1.235000e-08

-> meas tran vout50 when vout=0.9 RISE=2
vout50              =  1.237150e-08

-> let tpLH = vout50 - vin50
-> print tpLH 
tplh = 2.150000e-11
```

```
Here,
PULSE (V1 V2 TD TR TF PW PER NP)

---------------------------------------------------------
| Name |      Parameter  	| Default Value | Units |
---------------------------------------------------------
|  V1  | Initial value 		|        -      | V, A  |
|  V2  | Pulsed value  		|        -      | V, A  |
|  TD  | Delay time    		|     0.0       |  sec  |
|  TR  | Rise time     		|     TSTEP     |  sec  | 
|  TF  | Fall time     		|     TSTEP     |  sec  |
|  PW  | Pulse width   		|     TSTOP     |  sec  |
|  PER | Period        		|     TSTOP     |  sec  |
|  NP  | Number of Pulses *) 	|   unlimited   |   -   |
```

## Rise Time and Fall Time
The switching speed of a CMOS gate is dependent on the time taken to charge and discharge the load capacitance. When we give an input transition of either 0 or 1 then results in an output transition that gives either charges (CL) toward VDD or discharges (CL) toward VSS. 

**Rise time** tr: Time is taken by waveform to reach from 10% to 90% of its steady-state value. 
**Fall time** tf: Time is taken by the waveform to reach from 90% to 10% of steady-state value.

```
RISE time

-> meas tran t10 when vout=0.18 RISE=1
t10                 =  4.451165e-09

-> meas tran t90 when vout=1.6 RISE=1
t90                 =  4.506103e-09

-> let tr = t90 - t10
-> print tr
tr = 5.493800e-11

################################################

FALL time

-> meas tran t10 when vout=0.18 FALL=1
t10                 =  2.022359e-10

-> meas tran t90 when vout=1.6 FALL=1
t90                 =  1.559430e-10

-> let tf = t10 - t90
-> print tf
tf = 4.629290e-11
```

![Asset 18](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/82f5b2a1-4e8d-44f2-a161-ec519212bcf4)

The rise time and fall time are clearly observed in the above graph representing the stiffness of the POS edge and NEG edge.
```
for the first graph,
tr = 0.3
tf = 0.3

for the second graph,
tr = 0.1
tf = 0.1
```

## Delay Improvement 
The propagation delay of a gate can be minimized in the following ways:

### Increase VDD 
The delay of a gate can be modulated by modifying the supply voltage. This flexibility allows the designer to trade off energy dissipation for performance.

```
VDD = 1 volt

-> meas tran t10 when vout=0.1 RISE=1
t10                 =  4.591756e-09

-> meas tran t90 when vout=0.9 RISE=1
t90                 =  4.648264e-09

-> let tr = t90 - t10
-> print tr
tr = 5.650800e-11


VDD = 1.8 volt

-> meas tran t10 when vout=0.18 RISE=1
t10                 =  4.451165e-09

-> meas tran t90 when vout=1.6 RISE=1
t90                 =  4.506103e-09

-> let tr = t90 - t10
-> print tr
tr = 5.493800e-11

so that, by increasing the VDD delay can be decreased. 
```

### Increase the W/L ratio of the transistors 
This is the most powerful and effective performance optimization tool in the hands of the designer. Increasing the transistor size also raises the diffusion
capacitance and hence CL. In fact, once the intrinsic capacitance (i.e. the diffusion capacitance) starts to dominate the extrinsic load formed by wiring and fanout, increasing the gate size no longer helps in reducing the delay, and only makes the gate larger in area. This effect is called “self-loading”. 
In addition, wide transistors have a larger gate capacitance, which increases the fan-out factor of the driving gate and adversely affects its speed.

```
PMOS 	w = 6
NMOS	w = 3 

-> meas tran t10 when vout=0.18 RISE=1
t10                 =  4.457064e-09

-> meas tran t90 when vout=1.6 RISE=1
t90                 =  4.509806e-09

-> let tr = t90 - t10
-> print tr
tr = 5.274200e-11

there is a little reduction of delay due to the large size of the inverter..
in some cases, after increasing the size of the inverter it remains the same because the over-capacitance remains the same 
```

### Reduce CL
Remember that three major factors contribute to the load capacitance: the internal diffusion capacitance of the gate itself, the interconnect capacitance, and the fanout. Careful layout helps to reduce the diffusion and interconnect capacitances. Good design practice requires keeping the drain diffusion areas as small as possible.

```
added load capacitance of 5 ff 

-> meas tran t10 when vout=0.18 RISE=1 
t10                 =  4.463457e-09

-> meas tran t90 when vout=1.6 RISE=1
t90                 =  4.546240e-09

-> let tr = t90 - t10
-> print tr
tr = 8.278300e-11

It proves that the load capacitances directly affect the delay number
```

## Power analysis
Each time the capacitor CL gets charged through the PMOS transistor, its voltage rises from 0 to VDD, and a certain amount of energy is drawn from the power supply. Part of this energy is dissipated in the PMOS device, while the remainder is stored on the load capacitor. During the high-to-low transition, this capacitor is discharged, and the stored energy is dissipated in the NMOS transistor.

COMS has 3 types of power Consumption. 

1. Dynamic Power Consumption: Charging and Discharging Capacitors.
2. Short Circuit Currents: Short circuit paths between supply rails during switching.
3. Leakage: Leaking diodes and transistors.

![eq](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/2c0d04ce-4972-4e46-8848-cedbed33edf8)

In this analysis, we consider all the power of the CMOS inverter together. 

![Asset 16](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/fba4d11f-b081-4641-8afd-86b8bd86fe79)

```
Load 10pF

-> meas tran curr integ vin#branch from=8.6e-09 to=17.2e-09
curr                =  -1.49742e-16 from=  8.60000e-09 to=  1.72000e-08

-> let power = curr*1.8   
-> print power 
power = -2.69535e-16

-> let avg_power = power/8.6e-09 
-> print avg_power
avg_power = -3.13413e-08


Load 50pF

-> meas tran curr integ vin#branch from=8.6e-09 to=17.2e-09
curr                =  -4.73694e-17 from=  8.60000e-09 to=  1.72000e-08

-> let power = curr*1.8   
-> print power 
power = -8.52649e-17

-> let avg_power = power/8.6e-09 
-> print avg_power
avg_power = -9.91452e-09
```
![Asset 19](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/0c9bfa03-7875-4d99-a739-4aa7e53e5d5e)

## Analysis environment 

![Screenshot from 2023-09-06 15-03-51](https://github.com/RukmiChavda/Inverter-pre-layout-Design/assets/82014536/c77f1242-5964-4727-a63b-c67cb8608b78)


# Inverter-layout-design

## SKY-130 Metal Layer Stack Diagram 
![metal stack diagram](https://github.com/RukmiChavda/inverter-layout-design/assets/82014536/b9ccf2e7-1574-469e-aa71-3d22a4419a32)

## Magic Layout
![Screenshot from 2023-10-16 15-43-26](https://github.com/RukmiChavda/inverter-layout-design/assets/82014536/acf575e2-053d-420f-a137-043eaf43d9dc)

## DRC Result

## LVS Result
Final result: Circuits match uniquely.
Property errors were found.
