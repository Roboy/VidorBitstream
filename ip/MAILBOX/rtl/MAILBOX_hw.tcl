# TCL File Generated by Component Editor 18.0
# Tue Sep 11 17:33:16 CEST 2018
# DO NOT MODIFY


# 
# MAILBOX "MAILBOX" v1.0
#  2018.09.11.17:33:16
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module MAILBOX
# 
set_module_property DESCRIPTION ""
set_module_property NAME MAILBOX
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP ipTronix
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME MAILBOX
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
set_module_property ELABORATION_CALLBACK            elaboration_callback


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL MAILBOX
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file MAILBOX.sv SYSTEM_VERILOG PATH MAILBOX.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter pDPRAM_BITS INTEGER 9
set_parameter_property pDPRAM_BITS DEFAULT_VALUE 9
set_parameter_property pDPRAM_BITS DISPLAY_NAME pDPRAM_BITS
set_parameter_property pDPRAM_BITS TYPE INTEGER
set_parameter_property pDPRAM_BITS UNITS None
set_parameter_property pDPRAM_BITS HDL_PARAMETER true
add_parameter pFIFO_BITS INTEGER 4
set_parameter_property pFIFO_BITS DEFAULT_VALUE 4
set_parameter_property pFIFO_BITS DISPLAY_NAME pFIFO_BITS
set_parameter_property pFIFO_BITS TYPE INTEGER
set_parameter_property pFIFO_BITS UNITS None
set_parameter_property pFIFO_BITS HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""

add_interface_port clock_sink iCLOCK clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink iRESET reset Input 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock clock_sink
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end oMST_AK ak Output 1
add_interface_port conduit_end iMST_RQ rq Input 1


# 
# connection point slv
# 
add_interface slv avalon end
set_interface_property slv addressUnits WORDS
set_interface_property slv associatedClock clock_sink
set_interface_property slv associatedReset reset_sink
set_interface_property slv bitsPerSymbol 8
set_interface_property slv burstOnBurstBoundariesOnly false
set_interface_property slv burstcountUnits WORDS
set_interface_property slv explicitAddressSpan 0
set_interface_property slv holdTime 0
set_interface_property slv linewrapBursts false
set_interface_property slv maximumPendingReadTransactions 0
set_interface_property slv maximumPendingWriteTransactions 0
set_interface_property slv readLatency 1
set_interface_property slv readWaitStates 0
set_interface_property slv readWaitTime 0
set_interface_property slv setupTime 0
set_interface_property slv timingUnits Cycles
set_interface_property slv writeWaitTime 0
set_interface_property slv ENABLED true
set_interface_property slv EXPORT_OF ""
set_interface_property slv PORT_NAME_MAP ""
set_interface_property slv CMSIS_SVD_VARIABLES ""
set_interface_property slv SVD_ADDRESS_GROUP ""

add_interface_port slv iSLV_WRITE write Input 1
add_interface_port slv iSLV_READ read Input 1
add_interface_port slv iSLV_WRITE_DATA writedata Input 32
add_interface_port slv oSLV_READ_DATA readdata Output 32
set_interface_assignment slv embeddedsw.configuration.isFlash 0
set_interface_assignment slv embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment slv embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment slv embeddedsw.configuration.isPrintableDevice 0


# 
# connection point mst
# 
add_interface mst avalon end
set_interface_property mst addressUnits WORDS
set_interface_property mst associatedClock clock_sink
set_interface_property mst associatedReset reset_sink
set_interface_property mst bitsPerSymbol 8
set_interface_property mst burstOnBurstBoundariesOnly false
set_interface_property mst burstcountUnits WORDS
set_interface_property mst explicitAddressSpan 0
set_interface_property mst holdTime 0
set_interface_property mst linewrapBursts false
set_interface_property mst maximumPendingReadTransactions 0
set_interface_property mst maximumPendingWriteTransactions 0
set_interface_property mst readLatency 1
set_interface_property mst readWaitStates 0
set_interface_property mst readWaitTime 0
set_interface_property mst setupTime 0
set_interface_property mst timingUnits Cycles
set_interface_property mst writeWaitTime 0
set_interface_property mst ENABLED true
set_interface_property mst EXPORT_OF ""
set_interface_property mst PORT_NAME_MAP ""
set_interface_property mst CMSIS_SVD_VARIABLES ""
set_interface_property mst SVD_ADDRESS_GROUP ""

add_interface_port mst iMST_WRITE write Input 1
add_interface_port mst iMST_READ read Input 1
add_interface_port mst iMST_WRITE_DATA writedata Input 32
add_interface_port mst oMST_READ_DATA readdata Output 32
set_interface_assignment mst embeddedsw.configuration.isFlash 0
set_interface_assignment mst embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment mst embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment mst embeddedsw.configuration.isPrintableDevice 0

# -----------------------------------------------------------------------------
# callbacks
# -----------------------------------------------------------------------------

proc elaboration_callback {} {
  set addr_bits  [get_parameter_value pDPRAM_BITS] 
  add_interface_port mst iMST_ADDRESS address Input $addr_bits
  add_interface_port slv iSLV_ADDRESS address Input $addr_bits
} 

