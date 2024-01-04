v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {Inverter.sym} 515 -235 0 0 {name=x1}
C {devices/vsource.sym} 235 -232.5 0 0 {name=VDD value=1.8}
C {devices/vsource.sym} 325 -232.5 0 0 {name=Vin value="PULSE(0 1.8 0 0.3NS 0.3NS 4NS 8.6NS 4)"}
C {devices/gnd.sym} 605 -235 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 325 -202.5 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 235 -202.5 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 235 -262.5 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 325 -262.5 0 0 {name=p2 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 515 -295 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {devices/lab_pin.sym} 605 -355 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 695 -295 2 0 {name=p5 sig_type=std_logic lab=Vout}
C {devices/code_shown.sym} 182.5 -400 0 0 {name=Inverter only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc Vin 0 2 .1m   
.tran .02n 20n
.save all 
.end"}
