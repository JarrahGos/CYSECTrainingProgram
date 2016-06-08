CFLAGS=-g -O2 -Wall -Wextra -Isrc -rdynamic -DNDEBUG 

SOURCES=$(wildcard src/**/*.c src/*.c)
OBJECTS=$(patsubst %.c,%.o,$(SOURCES))
TEST_SRC=$(wildcard tests/*_tests.c)
TESTS=$(patsubst %.c,%,$(TEST_SRC))
TARGET=bulid/<Target>

all: $(Target) $(SO_TARGET) tests

$(TARGET): CFLAGS += -fPIC
$(TARGET): build $(OBJECTS)
       ar rcs $@ $(OBJECTS)
       ranlib $@

build:
       @mkdir -p build
       @mkdir -p bin


.PHONY: tests # The Unit Tests
tests: CFLAGS += $(TARGET)
tests: $(TESTS)
       sh ./tests/runtests.sh

clean: # The Cleaner
       rm -rf build $(OBJECTS) $(TESTS)
       rm -f tests/tests.log
       find . -name "*.gc*" -exec rm {} \;
       rm -rf `find . -name "*.dSYM" -print`

install: all # The Install
       install -d $(DESTDIR)/$(PREFIX)/lib/
       install $(TARGET) $(DESTDIR)/$(PREFIX)/lib/
