# Makefile for compiling and running VHDL code using GHDL

# Set the main VHDL file name (without the .vhd extension)
MAIN_FILE = updowncounter_tb

# GHDL options
GHDL_FLAGS = --std=08

# Targets
all: compile run

compile:
	ghdl -a $(GHDL_FLAGS) $(MAIN_FILE).vhd
	ghdl -a $(GHDL_FLAGS) updowncounter.vhd  # Compile the UpDownCounter entity
	ghdl -e $(GHDL_FLAGS) $(MAIN_FILE)

run:
	ghdl -r $(GHDL_FLAGS) $(MAIN_FILE) --wave=$(MAIN_FILE).ghw

clean:
	rm -f *.o *.cf $(MAIN_FILE) $(MAIN_FILE).ghw

.PHONY: all compile run clean
