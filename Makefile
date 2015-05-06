
VHDL_SRC   := $(wildcard *.vhdl)
BENCHS_SRC := $(wildcard *_bench.vhdl)
BENCHS 	   := $(BENCHS_SRC:.vhdl=)

GHDL_CMD = 		ghdl
GHDL_FLAGS  = 	-fexplicit --std=02 --ieee=synopsys --warn-no-vital-generic
GHDL_SIM_OPT = 	--ieee-asserts=disable

WAVEFORM_VIEWER = gtkwave

all: $(BENCHS)

%_bench: $(VHDL_SRC)
	@echo [$@]
	$(GHDL_CMD) -a $(GHDL_FLAGS) *.vhdl
	$(GHDL_CMD) -e $(GHDL_FLAGS) $@
	$(GHDL_CMD) -r $(GHDL_FLAGS) $@ $(GHDL_SIM_OPT) --vcd=$@.vcd
	$(WAVEFORM_VIEWER) $@.vcd

clean:
	$(GHDL_CMD) --clean
	rm -rf *.vcd work-obj93.cf
