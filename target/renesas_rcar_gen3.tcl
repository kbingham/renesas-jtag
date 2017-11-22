# Common Renesas R-Car Generation 2 config file

# Coresight Debug Access Port
if { [info exists DAP_TAPID] } {
	set _DAP_TAPID $DAP_TAPID
} else {
	set _DAP_TAPID 0x5ba00477
}

adapter_khz 1000
echo "********** Set Adapter khz"

proc init_reset {mode} {
    echo " in init_reset ${mode} "
    # Assert both resets: equivalent to a power-on reset
    jtag_reset 1 1

    # Deassert TRST to begin TAP communication
    jtag_reset 0 1

    # TAP should now be responsive, validate the scan-chain
    jtag arp_init
}
