
VHDL_SRC   := $(wildcard *.vhdl)
BENCHS_SRC := $(wildcard *_bench.vhdl)
BENCHS 	   := $(BENCHS_SRC:.vhdl=)

GHDL_CMD = 		ghdl
GHDL_FLAGS  =
GHDL_SIM_OPT =  --stop-time=1000ns

WAVEFORM_VIEWER = gtkwave

all: $(BENCHS)

%_bench: $(VHDL_SRC)
	@echo [$@]
	$(GHDL_CMD) -a $(GHDL_FLAGS) *.vhdl
	$(GHDL_CMD) -e $(GHDL_FLAGS) $@
	$(GHDL_CMD) -r $(GHDL_FLAGS) $@ $(GHDL_SIM_OPT) --wave=$@.ghw
	$(WAVEFORM_VIEWER) $@.ghw

clean:
	$(GHDL_CMD) --clean
	rm -rf *.ghw work-obj93.cf
