
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/utils_1/imports/synth_1/topLevel.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2i
gC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/utils_1/imports/synth_1/topLevel.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
c
Command: %s
53*	vivadotcl22
0synth_design -top topLevel -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7a35tcpg236-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
16532Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:03 . Memory (MB): peak = 1406.371 ; gain = 449.148
h px� 
�
synthesizing module '%s'%s4497*oasys2

topLevel2
 2[
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/topLevel.v2
238@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

debounce2
 2[
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/debounce.v2
228@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

debounce2
 2
02
12[
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/debounce.v2
228@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
sev_seg2
 2Z
VC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/sev_seg.v2
228@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
sev_seg2
 2
02
12Z
VC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/sev_seg.v2
228@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ps22
 2V
RC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/ps2.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ps22
 2
02
12V
RC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/ps2.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
vga_top2
 2Z
VC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/vga_top.v2
228@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
vga_low_level2
 2`
\C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/vga_low_level.v2
218@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
vga_low_level2
 2
02
12`
\C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/vga_low_level.v2
218@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
vga_top2
 2
02
12Z
VC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/vga_top.v2
228@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
img_display2
 2b
^C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/new/img_display.v2
248@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
img_display2
 2
02
12b
^C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/new/img_display.v2
248@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
blk_mem_gen_02
 2�
�C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.runs/synth_1/.Xil/Vivado-29276-LAPTOP-QJ9BJU4G/realtime/blk_mem_gen_0_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
blk_mem_gen_02
 2
02
12�
�C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.runs/synth_1/.Xil/Vivado-29276-LAPTOP-QJ9BJU4G/realtime/blk_mem_gen_0_stub.v2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
img_processor2
 2d
`C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/new/img_processor.v2
238@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
img_processor2
 2
02
12d
`C:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/new/img_processor.v2
238@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

topLevel2
 2
02
12[
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/sources_1/topLevel.v2
238@Z8-6155h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
pix_data[3]2	
vga_topZ8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
pix_data[2]2	
vga_topZ8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
pix_data[1]2	
vga_topZ8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
pix_data[0]2	
vga_topZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1532.965 ; gain = 575.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1532.965 ; gain = 575.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1532.965 ; gain = 575.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0092

1532.9652
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.gen/sources_1/ip/blk_mem_gen_0_1/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2

my_rom	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.gen/sources_1/ip/blk_mem_gen_0_1/blk_mem_gen_0/blk_mem_gen_0_in_context.xdc2

my_rom	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2[
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/constrs_1/pinout.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2[
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/constrs_1/pinout.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2Y
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.srcs/constrs_1/pinout.xdc2
.Xil/topLevel_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1636.4062
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0032

1636.4062
0.000Z17-268h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002
my_rom2
clka2
10.000Z38-316h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
g
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
ps2Z8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                                0 |                               00
h p
x
� 
y
%s
*synth2a
_               RECEIVING |                                1 |                               01
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2
ps2Z8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:09 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   21 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   7 Input   20 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   20 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   19 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input   19 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   18 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   18 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input   17 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   17 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   17 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     12 Bit         XORs := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	                8 Bit    Wide XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               24 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               21 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	               15 Bit    Registers := 9     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 20    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   21 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   15 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   15 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 14    
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   3 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   7 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 43    
h p
x
� 
F
%s
*synth2.
,	  11 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	  40 Input    1 Bit        Muxes := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:06 ; elapsed = 00:00:12 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:08 ; elapsed = 00:00:16 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:08 ; elapsed = 00:00:17 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:08 ; elapsed = 00:00:18 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[7]Z8-4442h px� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[6]Z8-4442h px� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[5]Z8-4442h px� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[4]Z8-4442h px� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[3]Z8-4442h px� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[2]Z8-4442h px� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[1]Z8-4442h px� 
a
*BlackBox module %s has unconnected pin %s
3599*oasys2
my_rom2	
dina[0]Z8-4442h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |blk_mem_gen_0 |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
7
%s*synth2
+------+------------+------+
h px� 
7
%s*synth2
|      |Cell        |Count |
h px� 
7
%s*synth2
+------+------------+------+
h px� 
7
%s*synth2
|1     |blk_mem_gen |     1|
h px� 
7
%s*synth2
|2     |BUFG        |     1|
h px� 
7
%s*synth2
|3     |CARRY4      |   108|
h px� 
7
%s*synth2
|4     |LUT1        |    18|
h px� 
7
%s*synth2
|5     |LUT2        |   137|
h px� 
7
%s*synth2
|6     |LUT3        |   252|
h px� 
7
%s*synth2
|7     |LUT4        |   241|
h px� 
7
%s*synth2
|8     |LUT5        |   104|
h px� 
7
%s*synth2
|9     |LUT6        |   200|
h px� 
7
%s*synth2
|10    |MUXF7       |    18|
h px� 
7
%s*synth2
|11    |FDRE        |   426|
h px� 
7
%s*synth2
|12    |FDSE        |    15|
h px� 
7
%s*synth2
|13    |IBUF        |     4|
h px� 
7
%s*synth2
|14    |OBUF        |    37|
h px� 
7
%s*synth2
+------+------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 8 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:08 ; elapsed = 00:00:19 . Memory (MB): peak = 1636.410 ; gain = 575.742
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:10 ; elapsed = 00:00:20 . Memory (MB): peak = 1636.410 ; gain = 679.188
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0072

1636.4102
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
126Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1636.4102
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

40b53ccfZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
422
62
82
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:112

00:00:242

1636.4102

1080.582Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1636.4102
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2Y
WC:/Users/Nico/Documents/Projects/Firmware/FPGA_LAB5/FPGA_LAB5.runs/synth_1/topLevel.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2[
Yreport_utilization -file topLevel_utilization_synth.rpt -pb topLevel_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Nov  3 01:36:18 2024Z17-206h px� 


End Record