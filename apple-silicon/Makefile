TARGET ?= hello

ifneq ($(V),1)
	Q		:= @
	NULL	:= 2>/dev/null
endif

CC ?= clang

SRC_DIR = .
OBJ_DIR = obj

OBJS  = $(OBJ_DIR)/$(TARGET).o

CFLAGS  = # -g Debugging
LDFLAGS = -e _start # tell that the start is not main, but _start

BINARY = $(TARGET).bin

.SECONDEXPANSION:
.SECONDARY:

$(shell mkdir -p $(OBJ_DIR))

all: $(BINARY)

%.bin: $(OBJS) Makefile
	$(Q)$(CC) $(LDFLAGS) $(OBJS) -o $(*).bin

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	$(Q)$(CC) $(CFLAGS) -o $@ -c $<

clean:
	$(Q)rm -rf $(OBJ_DIR) hello.bin shell.bin

.PHONY: clean
