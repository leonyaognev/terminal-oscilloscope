BIN := osc
SRCDIR := src
NIM := nim
NIMFLAGS := --hints:off --warnings:on --opt:speed
DESTDIR ?= 
BINDIR := $(DESTDIR)/usr/bin
BUILDDIR := build

.PHONY: all clean install uninstall run

all: $(BIN)

$(BIN):
	@mkdir -p $(BUILDDIR)
	@$(NIM) c $(NIMFLAGS) -o:$(BUILDDIR)/$(BIN) $(SRCDIR)/$(BIN).nim

run: $(BIN)
	@echo "starting build/osc"
	@./$(BUILDDIR)/$(BIN)

clean:
	@echo "cleaning..."
	@rm -rf $(BUILDDIR)
	@echo "done"

install: $(BIN)
	@echo "installing to $(BINDIR)/$(BIN)"
	@install -Dm755 $(BUILDDIR)/$(BIN) $(BINDIR)/$(BIN)
	@echo "done"

uninstall:
	@echo "removing $(BINDIR)/$(BIN)"
	@rm -f $(BINDIR)/$(BIN)
	@echo "done"
