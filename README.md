## C++ Makefile project for GLFW3 and ImGui Project

## Linux distro setup

### Slackware 15 Linux prerequisites
- Build GLFW3 package using slackbuild, install package using slackpkg.

### Check OpenGl version
```bash
~$ glxinfo | grep "version"
server glx version string: 1.4
client glx version string: 1.4
GLX version: 1.4
    Max core profile version: 0.0
    Max compat profile version: 2.1
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 2.0
OpenGL version string: 2.1 Mesa 21.3.5
OpenGL shading language version string: 1.20
OpenGL ES profile version string: OpenGL ES 2.0 Mesa 21.3.5
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 1.0.16
```

### ImGui Docking Branch Install
- Download file `imgui-docking.zip` from the [ImGui Docking branch](https://github.com/ocornut/imgui/tree/docking) github.com page.
- Extract zip file to any folder.
- Create new project folder `src/imgui`.
- Copy the following files from the extracted `imgui-docking` folder to the newly created folder.
```
LICENSE.txt
imconfig.h
imgui.h
imgui_internal.h
imstb_rectpack.h
imconfig.h
imgui_demo.cpp
imgui_tables.cpp
imstb_textedit.h
imgui.cpp
imgui_draw.cpp
imgui_widgets.cpp
imstb_truetype.h
```

- Copy the following files from the extracted `imgui-docking/misc/cpp/` folder to the newly created folder.

```
imgui_stdlib.h
imgui_stdlib.cpp
```

### ImGui GLFW OpenGL2 Example
- Copy the following files from the extracted `backends/` folder into `src/imgui`
```
imgui_impl_opengl2.h
imgui_impl_opengl2.cpp
imgui_impl_glfw.h
imgui_impl_glfw.cpp
```

- Copy the `main.cpp` file from the extracted
`examples/example_glfw_opengl2` folder into `src/imgui`
- rename `main.cpp` to `opengl-glfw_example.cpp`

### Compiling using Makefile

- Make sure the Makefile contains the following:-
```Makefile
# compiler and linker flags
CXX_FLAGS := -O3 -std=c++20 -Wno-unused-result -Wno-deprecated-declarations
INCLUDES  := -I ./src -I ./src/include -I ./src/imgui
LDFLAGS   := -O3 -lglfw -lGL

SRC_FILES := $(wildcard src/*.cpp src/imgui/*.cpp) 
```

### External References
- [GLFW is an Open Source, multi-platform library for OpenGL..](https://www.glfw.org/)
- [GLFW | Documentation](https://www.glfw.org/documentation.html)
- [Slackware 15 slackbuild packaage | GLFW v3.4](https://slackbuilds.org/repository/15.0/libraries/glfw3/?search=glfw)
- [github.com | GLFW v3.4 source files](https://github.com/glfw/glfw/archive/3.4/glfw-3.4.tar.gz)
- [github.com | GLFW ](https://github.com/glfw/glfw)
- [youtube.com | Zen Sepiol | How to use Dear ImGui to build a simple Gui-App Framework in C++](https://www.youtube.com/watch?v=OYQp0GuoByM)
