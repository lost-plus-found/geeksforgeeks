BINDIR=/usr/local/bin
UNAME_S:=$(shell uname -s)

.PHONY: install uninstall update

install:
	install -m775 -d $(BINDIR)
	@if [ "$(UNAME_S)" = "Linux" ]; then\
		install -m775 -t $(BINDIR) g4g; \
	fi
	@if [ "$(UNAME_S)" = "Darwin" ]; then\
		install -m775 g4g $(BINDIR); \
	fi

uninstall:
	rm -f $(BINDIR)/g4g

update:
	rm -f $(BINDIR)/g4g
	git pull origin master
	install -m775 -d $(BINDIR)
	@if [ "$(UNAME_S)" = "Linux" ]; then\
		install -m775 -t $(BINDIR) g4g; \
	fi
	@if [ "$(UNAME_S)" = "Darwin" ]; then\
		install -m775 g4g $(BINDIR); \
	fi
	
