# Compiler and Flags
CC = gcc
CFLAGS = -Iinclude

# Directories
SRC_DIR = src
INC_DIR = include
OBJ_DIR = build/obj
BUILD_DIR = build

# Files
SRCS = main.c $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst %.c,$(OBJ_DIR)/%.o,$(notdir $(SRCS)))
EXEC = $(BUILD_DIR)/main

# Rules
all: $(EXEC)

$(EXEC): $(OBJS) | $(BUILD_DIR)
	$(CC) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/main.o: main.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR) $(OBJ_DIR):
	mkdir -p $@

run: all
	./$(EXEC)

clean:
	rm -rf $(BUILD_DIR)
