ROM_NAME := potty_unpotty_deluxe
BUILD_DIR := build
SRC := src/main.asm

all: $(BUILD_DIR)/$(ROM_NAME).gbc

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(ROM_NAME).o: $(SRC) | $(BUILD_DIR)
	rgbasm -o $@ $<

$(BUILD_DIR)/$(ROM_NAME).gbc: $(BUILD_DIR)/$(ROM_NAME).o
	rgblink -o $@ $<
	rgbfix -v -p 0xFF -t "POTTYDX" -k "01" -l 0x33 -m 0x00 -n 0x00 -r 0x00 $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
