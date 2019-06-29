VERSION  := $(shell cat VERSION)
GOPKG    := github.com/conreality/conreality-developer

GOMOBILE ?= gomobile
LUAC     ?= luac

TARGETS  := scripts/hello.luac                     \
            scripts/prelude.luac                   \
            android/app/libs/developer.aar         \
            android/app/libs/developer-sources.jar \
            ios/Frameworks/Developer.framework

all: $(TARGETS)

%.luac: %.lua
	$(LUAC) -o $@ $<

android/app/libs/developer.aar:
	$(GOMOBILE) bind -o $@ -target=android/arm64 -tags=android -javapkg=app.conreality $(GOPKG)

android/app/libs/developer-sources.jar: android/app/libs/developer.aar

ios/Frameworks/Developer.framework:
	$(GOMOBILE) bind -o $@ -target=ios/arm64 -tags=ios $(GOPKG)

clean:
	rm -rf *~ $(TARGETS)

distclean: clean

mostlyclean: clean

.PHONY: clean distclean mostlyclean
.SECONDARY:
.SUFFIXES:
