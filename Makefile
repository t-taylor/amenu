.POSIX:
DIR_BIN = /home/tom/.local/bin
SCRIPT = $(shell grep -lr "^#\!" ./* | sed 's/.\///')
CONFIG = $(shell find $$PWD -type f -name "*rc")
init:
	@[ $(CONFIG) ] && { \
		[ -f ~/.config/$(CONFIG) ] || cp $(CONFIG) ~/.config; \
	} || exit 0
	@echo Initiation finished.
install:
	@mkdir -p $(DIR_BIN)
	@for script in $(SCRIPT); do \
		cp -f $$script $(DIR_BIN); \
		chmod 755 $(DIR_BIN)/$${script##*/}; \
		done
	@echo Installation finished.
uninstall:
	@for script in $(SCRIPT); do rm -f $(DIR_BIN)/$${script##*/}; done
	@echo Uninstallation finished.
.PHONY: init install uninstall
