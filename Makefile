NAME=speedrun_demorecord
SRCROOT=source-sdk-2013/sp/src/
TARGET_PLATFORM=linux32
TARGET_PLATFORM_EXT=
USE_VALVE_BINDIR=0
PWD:=$(shell pwd)
# If no configuration is specified, "release" will be used.
ifeq "$(CFG)" ""
	CFG = release
endif

GCC_ExtraCompilerFlags=
GCC_ExtraLinkerFlags=
SymbolVisibility=hidden
OptimizerLevel=-gdwarf-2 -g2 $(OptimizerLevel_CompilerSpecific)
SystemLibraries=
DLL_EXT=.so
SYM_EXT=.dbg
FORCEINCLUDES=
ifeq "$(CFG)" "debug"
DEFINES += -DVPC -DSSDK2013 -DRAD_TELEMETRY_DISABLED -DDEBUG -D_DEBUG -DGNUC -DPOSIX -DCOMPILER_GCC -D_DLL_EXT=.so -D_LINUX -DLINUX -DPOSIX -D_POSIX -DDLLNAME=speedrun_demorecord -DBINK_VIDEO -DGL_GLEXT_PROTOTYPES -DDX_TO_GL_ABSTRACTION -DUSE_SDL -DDEV_BUILD -DFRAME_POINTER_OMISSION_DISABLED -D_MBCS -D_EXTERNAL_DLL_EXT=.so -DVPCGAMECAPS=VALVE -DPROJECTDIR=/root/speedrun-demo-record-2013/sp/src/utils/speedrun_demorecord -D_DLL_EXT=.so -DSOURCE1=1 -DVPCGAME=valve -D_LINUX=1 -D_POSIX=1 -DLINUX=1 -DPOSIX=1
else
DEFINES += -DVPC -DSSDK2013 -DRAD_TELEMETRY_DISABLED -DNDEBUG -DGNUC -DPOSIX -DCOMPILER_GCC -D_DLL_EXT=.so -D_LINUX -DLINUX -DPOSIX -D_POSIX -DDLLNAME=speedrun_demorecord -DBINK_VIDEO -DGL_GLEXT_PROTOTYPES -DDX_TO_GL_ABSTRACTION -DUSE_SDL -DDEV_BUILD -DFRAME_POINTER_OMISSION_DISABLED -D_MBCS -D_EXTERNAL_DLL_EXT=.so -DVPCGAMECAPS=VALVE -DPROJECTDIR=/root/speedrun-demo-record-2013/sp/src/utils/speedrun_demorecord -D_DLL_EXT=.so -DSOURCE1=1 -DVPCGAME=valve -D_LINUX=1 -D_POSIX=1 -DLINUX=1 -DPOSIX=1
endif
INCLUDEDIRS += ${SRCROOT}common ${SRCROOT}public ${SRCROOT}public/tier0 ${SRCROOT}public/tier1 ${SRCROOT}thirdparty/SDL2 ${SRCROOT}game/server ${SRCROOT}game/shared
CONFTYPE=dll
IMPORTLIBRARY=
GAMEOUTPUTFILE=${SRCROOT}../game/bin/speedrun_demorecord.so
OUTPUTFILE=$(OBJ_DIR)/speedrun_demorecord.so


POSTBUILDCOMMAND=true



CPPFILES= \
    ${SRCROOT}public/tier0/memoverride.cpp \
    speedrun_demorecord/speedrun_demorecord.cpp \


LIBFILES = \
    ${SRCROOT}lib/public/linux32/tier1.a \
    ${SRCROOT}lib/public/linux32/tier2.a \
    -L${SRCROOT}lib/public/linux32 -ltier0 \
    -L${SRCROOT}lib/public/linux32 -lvstdlib \


LIBFILENAMES = \
    ${SRCROOT}lib/public/linux32/libtier0.so \
    ${SRCROOT}lib/public/linux32/libvstdlib.so \
    ${SRCROOT}lib/public/linux32/tier1.a \
    ${SRCROOT}lib/public/linux32/tier2.a \


# Include the base makefile now.
include $(SRCROOT)/devtools/makefile_base_posix.mak



OTHER_DEPENDENCIES = \


$(OBJ_DIR)/_other_deps.P : $(OTHER_DEPENDENCIES)
	$(GEN_OTHER_DEPS)

-include $(OBJ_DIR)/_other_deps.P



ifneq (clean, $(findstring clean, $(MAKECMDGOALS)))
-include $(OBJ_DIR)/memoverride.P
endif

$(OBJ_DIR)/memoverride.o : $(PWD)/$(SRCROOT)public/tier0/memoverride.cpp $(PWD)/Makefile $(SRCROOT)/devtools/makefile_base_posix.mak
	$(PRE_COMPILE_FILE)
	$(COMPILE_FILE) $(POST_COMPILE_FILE)

ifneq (clean, $(findstring clean, $(MAKECMDGOALS)))
-include $(OBJ_DIR)/speedrun_demorecord.P
endif

$(OBJ_DIR)/speedrun_demorecord.o : $(PWD)/speedrun_demorecord/speedrun_demorecord.cpp $(PWD)/Makefile $(SRCROOT)/devtools/makefile_base_posix.mak
	$(PRE_COMPILE_FILE)
	$(COMPILE_FILE) $(POST_COMPILE_FILE)
