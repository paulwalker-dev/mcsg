TARGET := mchdl

all: $(TARGET)

$(TARGET): lex.yy.o y.tab.o
	cc $^ -o $@ -lfl

%.o: %.c
	cc -c $^ -o $@

lex.yy.c: $(TARGET).l y.tab.c
	lex $<

y.tab.c: $(TARGET).y
	yacc -d $<
