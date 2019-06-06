include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FaceIDForHiddenPhotos
FaceIDForHiddenPhotos_FILES = Tweak.xm
FaceIDForHiddenPhotos_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileSlideShow"
