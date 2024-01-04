v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 163.4375 -157.1875 163.4375 -137.1875 {
lab=Vout}
N 103.4375 -187.1875 123.4375 -187.1875 {
lab=Vin}
N 103.4375 -187.1875 103.4375 -107.1875 {
lab=Vin}
N 103.4375 -107.1875 123.4375 -107.1875 {
lab=Vin}
N 63.4375 -147.1875 103.4375 -147.1875 {
lab=Vin}
N 163.4375 -257.1875 163.4375 -217.1875 {
lab=VDD}
N 163.4375 -77.1875 163.4375 -37.1875 {
lab=GND}
N 163.4375 -107.1875 243.4375 -107.1875 {
lab=GND}
N 243.4375 -107.1875 243.4375 -67.1875 {
lab=GND}
N 163.4375 -67.1875 243.4375 -67.1875 {
lab=GND}
N 163.4375 -187.1875 243.4375 -187.1875 {
lab=VDD}
N 243.4375 -227.1875 243.4375 -187.1875 {
lab=VDD}
N 163.4375 -227.1875 243.4375 -227.1875 {
lab=VDD}
N 163.4375 -147.1875 263.4375 -147.1875 {
lab=Vout}
C {sky130_fd_pr/pfet_01v8.sym} 143.4375 -187.1875 0 0 {name=M1
L=0.15
W=3
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 143.4375 -107.1875 0 0 {name=M2
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 63.4375 -147.1875 0 0 {name=p1 lab=Vin
}
C {devices/opin.sym} 263.4375 -147.1875 0 0 {name=p2 lab=Vout}
C {devices/ipin.sym} 163.4375 -257.1875 0 0 {name=p3 lab=VDD}
C {devices/ipin.sym} 163.4375 -37.1875 0 0 {name=p4 lab=GND}
