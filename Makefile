VERSION  := $(shell cat VERSION)
GOPKG    := github.com/conreality/conreality-developer

GOMOBILE ?= gomobile

TARGETS  := android/app/libs/developer.aar         \
            android/app/libs/developer-sources.jar \
            ios/Frameworks/Developer.framework

all: $(TARGETS)

android/app/libs/developer.aar:
	$(GOMOBILE) bind -o $@ -target=android -tags=android -javapkg=app.conreality $(GOPKG)

android/app/libs/developer-sources.jar: android/app/libs/developer.aar

ios/Frameworks/Developer.framework:
	$(GOMOBILE) bind -o $@ -target=ios -tags=ios $(GOPKG)

clean:
	rm -rf *~ $(TARGETS)

distclean: clean

mostlyclean: clean

.PHONY: clean distclean mostlyclean
.SECONDARY:
.SUFFIXES:
