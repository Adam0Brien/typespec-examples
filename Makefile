
# Default target: Compile all TypeSpec files
compile:
	./script/run_typesec.sh

# Clean target: Remove generated files
clean:
	rm -rf tsp-output

# All target: Clean and compile
all: clean compile
