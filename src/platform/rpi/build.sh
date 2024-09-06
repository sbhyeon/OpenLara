set -e
CFLAGS = -marm -march=armv6 -mtune=arm1176jzf-s -std=c++11 -ffast-math -fno-exceptions -fno-rtti -ffunction-sections -fdata-sections

clang++ $CFLAGS -Os -s -g -Wl,--gc-sections -Wno-invalid-source-encoding -DNDEBUG -D__RPI__ main.cpp ../../libs/stb_vorbis/stb_vorbis.c ../../libs/minimp3/minimp3.cpp ../../libs/tinf/tinflate.c -I/opt/vc/include -I../../ -o../../../bin/OpenLara -L/opt/vc/lib/ -lbrcmGLESv2 -lbrcmEGL -lm -lrt -lpthread -lasound -lbcm_host -ludev

strip ../../../bin/OpenLara --strip-all --remove-section=.comment --remove-section=.note
