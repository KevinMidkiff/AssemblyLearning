CC=nasm
AVG_SOURCES=average.asm
AVG_EXE=average
SOURCES=*.asm
CCFLAGS=-f elf
LD=ld
EXECUTABLE=hello_world
LDFLAGS=-m elf_i386 -s -o


all: average

average: avg_compile avg_link

avg_link:
	$(LD) $(LDFLAGS) $(AVG_EXE) average.o

avg_compile:
	$(CC) $(CCFLAGS) $(AVG_SOURCES)

clean:
	rm *.o
	rm average
