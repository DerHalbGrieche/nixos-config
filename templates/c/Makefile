BIN_DIR ?= /usr/local/bin

TARGET_EXEC ?= build
BUILD_DIR ?= ./build
SRC_DIRS ?= ./core

SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))
CPPFLAGS ?= $(INC_FLAGS) -MMD -MP

.ONESHELL:
.RECIPEPREFIX := >
MAKEFLAGS += --silent
MAKEFLAGS += --no-print-directory


$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
> $(CXX) $(OBJS) -o $@ $(LDFLAGS)

# c source
$(BUILD_DIR)/%.c.o: %.c
> mkdir -p $(dir $@)
> $(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# c++ source
$(BUILD_DIR)/%.cpp.o: %.cpp
> mkdir -p $(dir $@)
> $(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHONY: build run clean install uninstall help

#HELP: builds the program
build: $(BUILD_DIR)/$(TARGET_EXEC)
>

#HELP: runs the program
run: $(BUILD_DIR)/$(TARGET_EXEC)
> ./$<

#HELP: cleans the build directory
clean:
> rm -r $(BUILD_DIR)

#HELP: installs the program
install: $(BUILD_DIR)/$(TARGET_EXEC)
> install -Dt $(BIN_DIR) $<

#HELP: uninstalls the program
uninstall:
> rm -f $(BIN_DIR)/$(TARGET_EXEC)

#HELP: prints this screen
help:
> @printf "Available targets\n\n"
> @awk '/^[a-zA-Z\-_0-9]+:/ {
>   helpMessage = match(lastLine, /^#HELP: (.*)/);
>   if (helpMessage) {
>     helpCommand = substr($$1, 0, index($$1, ":")-1);
>     helpMessage = substr(lastLine, RSTART + 6, RLENGTH);
>     gsub(/\\n/, "\n", helpMessage);
>     printf "\033[36m%-30s\033[0m %s\n", helpCommand, helpMessage;
>   }
> }
> { lastLine = $$0 }' $(MAKEFILE_LIST)

-include $(DEPS)
