
TESTBENCH := alu_bench

GHDL_CMD = 		ghdl
GHDL_FLAGS  = 	-fexplicit --std=02 --ieee=synopsys --warn-no-vital-generic
GHDL_SIM_OPT = 	--stop-time=510ns --ieee-asserts=disable

WAVEFORM_VIEWER = gtkwave

all: compile run view

compile:
	$(GHDL_CMD) -a $(GHDL_FLAGS) *.vhdl
	$(GHDL_CMD) -e $(GHDL_FLAGS) $(TESTBENCH)

run:
	$(GHDL_CMD) -r $(GHDL_FLAGS) $(TESTBENCH) $(GHDL_SIM_OPT) --vcd=$(TESTBENCH).vcd

view:
	$(WAVEFORM_VIEWER) $(TESTBENCH).vcd

clean:
	$(GHDL_CMD) --clean
	rm -rf *.vcd work-obj93.cf
