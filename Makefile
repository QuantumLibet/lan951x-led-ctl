GIT_TAG_LATEST := $(/bin/sh git --no-pager describe --abbrev=0 HEAD)

CFLAGS  = -g -Os -std=c11 -I./include -Wall -Wstrict-prototypes -Wconversion
CFLAGS += -Wmissing-prototypes -Wshadow -Wextra -Wunused
CFLAGS += -DVERSION=\"$(GIT_TAG_LATEST)\"
LDFLAGS = -lusb-1.0

all:
	@/bin/echo -e "\tcompiling"
	@gcc $(CFLAGS) -c src/lan951x-led-ctl.c -o lan951x-led-ctl.o

	@/bin/echo -e "\tlinking"
	@gcc $(CFLAGS) lan951x-led-ctl.o $(LDFLAGS) -o lan951x-led-ctl
	@strip lan951x-led-ctl

	@/bin/echo -e "\tinstalling to $(DESTDIR)/bin"
	@install -m 0755 -d $(DESTDIR)/bin
	@install -m 0755 -t $(DESTDIR)/bin lan951x-led-ctl

	@/bin/echo -e "\tcleanup"
	@rm -f lan951x-led-ctl.o
	@rm -f lan951x-led-ctl
	@/bin/echo -e "\tdone."
