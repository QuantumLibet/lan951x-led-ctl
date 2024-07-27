GIT_TAG_LATEST := $(/bin/sh git --no-pager describe --abbrev=0 HEAD)
CFLAGS  = -Os -std=c17 -I./include -DVERSION=\"$(GIT_TAG_LATEST)\"
LDFLAGS = -lusb-1.0

all:
	@/bin/echo -e "\tcompiling"
	@gcc $(CFLAGS) src/lan951x-led-ctl.c $(LDFLAGS) -o lan951x-led-ctl.o
	@strip lan951x-led-ctl

	@/bin/echo -e "\tinstalling to $(DESTDIR)/bin"
	@install -m 0755 -d $(DESTDIR)/bin
	@install -m 0755 -t $(DESTDIR)/bin lan951x-led-ctl

	@/bin/echo -e "\tcleanup"
	@rm -f lan951x-led-ctl
	@/bin/echo -e "\tdone."
