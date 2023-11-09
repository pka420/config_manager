.PHONY: all clean

img := nvim.sif

all: $(img)


$(img): recipe_nvim.def 
	apptainer build $(img) recipe_nvim.def

clean:
	@rm -f $(img)
