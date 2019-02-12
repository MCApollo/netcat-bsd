#	$OpenBSD: Makefile,v 1.7 2015/09/11 21:07:01 beck Exp $

PROG=	nc
SRCS=	netcat.c atomicio.c socks.c

CC=aarch64-apple-darwin17-clang
PKG_CONFIG ?= pkg-config
LIBS=  -lbsd -lresolv
OBJS=  $(SRCS:.c=.o)
CFLAGS=  -g -O2 -I. -I./libbsd/include
LDFLAGS=  -L./libbsd/lib/

all: nc
nc: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o nc

$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) nc
