#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

QUINTETD=${QUINTETD:-$BINDIR/quintetd}
QUINTETCLI=${QUINTETCLI:-$BINDIR/quintet-cli}
QUINTETTX=${QUINTETTX:-$BINDIR/quintet-tx}
QUINTETQT=${QUINTETQT:-$BINDIR/qt/quintet-qt}

[ ! -x $QUINTETD ] && echo "$QUINTETD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($QUINTETCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for quintetd if --version-string is not set,
# but has different outcomes for qtcoin-qt and quintet-cli.
echo "[COPYRIGHT]" > footer.h2m
$QUINTETD --version | sed -n '1!p' >> footer.h2m

for cmd in $QUINTETD $QUINTETCLI $QUINTETTX $QUINTETQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
