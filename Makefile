# to compile and run in one command type:
# make run

# define which compiler to use
CXX    := g++
OUTPUT := glfw_app

# if you need to manually specify your GLFW install dir, do so here
# for me it was:
# GLFW_DIR  := /usr/include/GLFW

# compiler and linker flags
CXX_FLAGS := -O3 -std=c++20 -Wno-unused-result -Wno-deprecated-declarations
INCLUDES  := -I ./src -I ./src/include -I ./src/imgui
LDFLAGS   := -O3 -lglfw -lGL

# the source files for the ecs game engine
SRC_FILES := $(wildcard src/*.cpp src/imgui/*.cpp) 
OBJ_FILES := $(SRC_FILES:.cpp=.o)

# Include dependency files
DEP_FILES := $(SRC_FILES:.cpp=.d)
-include $(DEP_FILES)

# all of these targets will be made if you just type make
all:$(OUTPUT)

# define the main executable requirements / command
$(OUTPUT):$(OBJ_FILES) Makefile
	$(CXX) $(OBJ_FILES) $(LDFLAGS) -o ./bin/$@ 

# specifies how the object files are compiled from cpp files
.cpp.o:
	$(CXX) -MMD -MP -c $(CXX_FLAGS) $(INCLUDES) $< -o $@

# typing 'make clean' will remove all intermediate build files
clean:
	rm -f $(OBJ_FILES) $(DEP_FILES) ./bin/$(OUTPUT)
    
# typing 'make run' will compile and run the program
run: $(OUTPUT)
	cd bin && ./$(OUTPUT) && cd ..