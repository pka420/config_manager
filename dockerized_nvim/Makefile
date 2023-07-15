.PHONY: all clean

img := ./nvim.sif

all: $(img)

$(img): sudo apptainer build $@ recipe_nvim.def

