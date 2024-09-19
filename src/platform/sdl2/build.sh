set -e

# Use this compilation line to build SDL2/GLES version, GLES2 version.
#clang++ -DSDL2_GLES -D_GAPI_GLES2 -std=c++11 `sdl2-config --cflags` -O3 -fno-exceptions -fno-rtti -ffunction-sections -fdata-sections -Wl,--gc-sections -Wno-invalid-source-encoding -DNDEBUG -D__SDL2__ main.cpp ../../libs/stb_vorbis/stb_vorbis.c ../../libs/minimp3/minimp3.cpp ../../libs/tinf/tinflate.c -I../../ -o OpenLara `sdl2-config --libs` -lGLESv2 -lEGL -lm -lrt -lpthread -lasound -ludev

# Use this compilation line to build SDL2/GLES version, GLES3, which is an extension to GLES2 so we use -lGLESv2, too.
#clang++ -DSDL2_GLES -std=c++11 `sdl2-config --cflags` -O3 -fno-exceptions -fno-rtti -ffunction-sections -fdata-sections -Wl,--gc-sections -Wno-invalid-source-encoding -Wno-pointer-bool-conversion -Wno-tautological-pointer-compare -DNDEBUG -D__SDL2__ main.cpp ../../libs/stb_vorbis/stb_vorbis.c ../../libs/minimp3/minimp3.cpp ../../libs/tinf/tinflate.c -I../../ -o OpenLara `sdl2-config --libs` -lGLESv2 -lEGL -lm -lrt -lpthread -lasound -ludev

# Use this compilation line to build SDL2/OpenGL version.
clang++ -std=c++11 `sdl2-config --cflags` -O3 -fno-exceptions -fno-rtti -ffunction-sections -fdata-sections -Wl,--gc-sections -Wno-invalid-source-encoding -DNDEBUG -D_NOLOG -D__SDL2__ -D_SDL2_OPENGL -DGAPI_GL main.cpp ../../libs/stb_vorbis/stb_vorbis.c ../../libs/minimp3/minimp3.cpp ../../libs/tinf/tinflate.c -I../../ -o OpenLara `sdl2-config --libs` -lGL -lm -lrt -lpthread -lasound -ludev
strip OpenLara --strip-all --remove-section=.comment --remove-section=.note
