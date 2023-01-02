STATICLIB = libpge.a
TARGET = pge
VERSION = 3

LIBOBJS = support/pgesupport.o pgeWav.o pgeTimer.o pgeMath.o pgeVram.o pgeFont.o pgeControls.o pgeGfx.o pgeTexture.o pgeZip.o pgeMp3.o pgeUtils.o pgeNet.o pgeAdhoc.o pgeFile.o pgeDir.o pgeObj.o pgeUsb.o pgeSystem.o pge.o
OBJS = $(LIBOBJS)

CFLAGS = $(DEFINES) -O3 -G0 -Wall -g -D__PSP__ -D__PGE__ -DPGE_VERSION=$(VERSION)
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

LIBDIR =
LDFLAGS =
PSP_FW_VERSION = 340

PSPSDK = $(shell psp-config --pspsdk-path)
PSPBIN = $(shell psp-config --psp-prefix)
CFLAGS += $(shell $(PSPBIN)/bin/freetype-config --cflags)
include $(PSPSDK)/lib/build.mak

lib: $(STATICLIB)

$(STATICLIB): $(LIBOBJS)
	$(AR) rcs $@ $(LIBOBJS)
	$(RANLIB) $@

install:
	cp -f pge_build.mak $(PSPSDK)/lib/
	mkdir -p $(PSPBIN)/include/pge/
	cp -f pgeWav.h $(PSPBIN)/include/pge/
	cp -f pgeTimer.h $(PSPBIN)/include/pge/
	cp -f pgeMath.h $(PSPBIN)/include/pge/
	cp -f pge.h $(PSPBIN)/include/pge/
	cp -f pgeDir.h $(PSPBIN)/include/pge/
	cp -f pgeSystem.h $(PSPBIN)/include/pge/
	cp -f pgeNet.h $(PSPBIN)/include/pge/
	cp -f pgeFont.h $(PSPBIN)/include/pge/
	cp -f pgeVram.h $(PSPBIN)/include/pge/
	cp -f pgeControls.h $(PSPBIN)/include/pge/
	cp -f pgeGfx.h $(PSPBIN)/include/pge/
	cp -f pgeTexture.h $(PSPBIN)/include/pge/
	cp -f pgeZip.h $(PSPBIN)/include/pge/
	cp -f pgeMp3.h $(PSPBIN)/include/pge/
	cp -f pgeUtils.h $(PSPBIN)/include/pge/
	cp -f pgeAdhoc.h $(PSPBIN)/include/pge/
	cp -f pgeFile.h $(PSPBIN)/include/pge/
	cp -f pgeEmulator.h $(PSPBIN)/include/pge/
	cp -f pgeObj.h $(PSPBIN)/include/pge/
	cp -f pgeParticle.h $(PSPBIN)/include/pge/
	cp -f pgeUsb.h $(PSPBIN)/include/pge/
	cp -f $(STATICLIB) $(PSPBIN)/lib/

install-win:
	copy pge_build.mak "$(PSPSDK)/lib/"
	if not exist "$(PSPBIN)/include/pge/" mkdir "$(PSPBIN)/include/pge/"
	copy pgeWav.h "$(PSPBIN)/include/pge/"
	copy pgeTimer.h "$(PSPBIN)/include/pge/"
	copy pgeMath.h "$(PSPBIN)/include/pge/"
	copy pge.h "$(PSPBIN)/include/pge/"
	copy pgeDir.h "$(PSPBIN)/include/pge/"
	copy pgeSystem.h "$(PSPBIN)/include/pge/"
	copy pgeNet.h "$(PSPBIN)/include/pge/"
	copy pgeFont.h "$(PSPBIN)/include/pge/"
	copy pgeVram.h "$(PSPBIN)/include/pge/"
	copy pgeControls.h "$(PSPBIN)/include/pge/"
	copy pgeGfx.h "$(PSPBIN)/include/pge/"
	copy pgeTexture.h "$(PSPBIN)/include/pge/"
	copy pgeZip.h "$(PSPBIN)/include/pge/"
	copy pgeMp3.h "$(PSPBIN)/include/pge/"
	copy pgeUtils.h "$(PSPBIN)/include/pge/"
	copy pgeAdhoc.h "$(PSPBIN)/include/pge/"
	copy pgeFile.h "$(PSPBIN)/include/pge/"
	copy pgeObj.h "$(PSPBIN)/include/pge/"
	copy pgeParticle.h "$(PSPBIN)/include/pge/"
	copy pgeUsb.h "$(PSPBIN)/include/pge/"
	copy "$(STATICLIB)" "$(PSPBIN)/lib/"

supportfiles:
	$(MAKE) -C support clean
	$(MAKE) -C support
	$(MAKE) -C support files