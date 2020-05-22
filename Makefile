# AppPauserRunit

PREFIX  := usr/local
DESTDIR := /

MANDIR  := $(DESTDIR)/$(PREFIX)/share/man

SCRIPTS  = apppauser-daemon apppauser-signal apppauser-launch
MANUALS  = AppPauser.1

.PHONY: all manual clean install

%.1 : man/%.md
	pandoc -V "title=$*" -V "section=1" -V "header=User Commands" -s -o $@ $<

all: manual

manual: $(MANUALS)

clean:
	rm -f $(MANUALS)

install: $(SCRIPTS) manual
	mkdir -p $(DESTDIR)/$(PREFIX)/bin
	$(foreach script,$(SCRIPTS),install -m755 $(script) $(DESTDIR)/$(PREFIX)/bin/$(script); )

	mkdir -p $(MANDIR)/man1
	install -m644 AppPauser.1 $(MANDIR)/man1/AppPauser.1
	$(foreach script,$(SCRIPTS),ln -sf AppPauser.1 $(MANDIR)/man1/$(script).1; )
