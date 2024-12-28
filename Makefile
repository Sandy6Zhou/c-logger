
OBJ := obj
INC := log/include 
LIB := log/lib
BIN := bin
SRC := test

CC := gcc
CFLAGS := -g -Wall -D__LINUX__ -I$(INC)
LDFLAGS := -L$(LIB) -llogger

OBJECTS := $(OBJ)/logger_app_test.o
TARGET := $(BIN)/logger_app_test

all:make_lib $(BIN) $(OBJ) $(TARGET)

make_lib:
	make -f Makefile.shared
	make -f Makefile.shared clean

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN):
	@echo "Checking if $(BIN) exists..."
	@if [ ! -d "$(BIN)" ]; then \
		echo "Directory $(BIN) does not exist. Creating..."; \
		mkdir -p $(BIN); \
	else \
		echo "Directory $(BIN) already exists. Skipping creation."; \
	fi

$(OBJ):
	@echo "Checking if $(OBJ) exists..."
	@if [ ! -d "$(OBJ)" ]; then \
		echo "Directory $(OBJ) does not exist. Creating..."; \
		mkdir -p $(OBJ); \
	else \
		echo "Directory $(OBJ) already exists. Skipping creation."; \
	fi


.PHONY: clean
clean:
	rm -rf $(OBJ) $(BIN)
