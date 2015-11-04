# vreview_reviewers kygreen rortega dhearn dcabrera
# vreview_group 6583Constraints
# vreview_closed http://review-board.natinst.com/r/75819/

# Clock Period Constraint (200MHz)
# This constraint affects IO Module Clock 0, which coresponds to the DDCA Strobe.
# To reduce the constraint, change '5' to the worst case period of your
# external clock.

create_clock -period 5 [get_ports {aUserGpio[14]}]

# Clock Period Constraint (200MHz)
# This constraint affects IO Module Clock 1, which coresponds to the DDCB Strobe.
# To reduce the constraint, change '5' to the worst case period of your
# external clock.

create_clock -period 5 [get_ports {aUserGpio[38]}]

# Don't analyze the timing on the input of the double syncs
set DoubleSyncMsRegs [get_cells -hier -regexp %ClipInstancePath%.*_ms_reg.* -filter {IS_SEQUENTIAL == TRUE}]
set DoubleSyncMsRegs_D [get_pins -of_objects $DoubleSyncMsRegs -filter {REF_PIN_NAME == D}]
set DoubleSyncMsDrivers [get_cells -of [filter [all_fanin -flat $DoubleSyncMsRegs_D] DIRECTION==OUT] -filter IS_SEQUENTIAL==TRUE]
set_max_delay -from $DoubleSyncMsDrivers -to $DoubleSyncMsRegs -datapath_only 25

# Set all clock crossing registers as async regs--this constraint grabs the Q pin of the ms_reg and
# gets the net off that pin (ie. the one going to the D pin of the second sync register). Then we get
# the cells hanging off of that net (the ms_reg and the second sync reg) and set async reg = true.
set_property async_reg TRUE [get_cells -of [get_nets -of [get_pins -hier -regexp {%ClipInstancePath%.*_ms.*/Q}]]]

# The SafeBUFGCE's clock enable is asynchronous, so don't analyze timing.
set ClockEnableReg [get_cells -hier %ClipInstancePath%/Ni6583Corex/rEnableClocks* -filter {IS_SEQUENTIAL == TRUE}]
set SeClockBuffer [get_cells -hier %ClipInstancePath%/Ni6583Corex/SeBufG/SafeBUFGCTRLx* -filter {IS_SEQUENTIAL == TRUE}]
set LvdsClockBuffer [get_cells -hier %ClipInstancePath%/Ni6583Corex/LvdsBufG/SafeBUFGCTRLx* -filter {IS_SEQUENTIAL == TRUE}]
set_max_delay -from $ClockEnableReg -to $SeClockBuffer -datapath_only 25
set_max_delay -from $ClockEnableReg -to $LvdsClockBuffer -datapath_only 25





