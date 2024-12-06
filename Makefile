
# Default target: Compile all TypeSpec files
compile:
	./scripts/run_typespec.sh

# Clean target: Remove generated files
clean:
	rm -rf tsp-output

# All target: Clean and compile
all: clean compile
