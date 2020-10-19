#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/qtcoin.png
ICON_DST=../../src/qt/res/icons/qtcoin.ico
convert ${ICON_SRC} -resize 16x16 qtcoin-16.png
convert ${ICON_SRC} -resize 32x32 qtcoin-32.png
convert ${ICON_SRC} -resize 48x48 qtcoin-48.png
convert qtcoin-16.png qtcoin-32.png qtcoin-48.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/qtcoin_testnet.png
ICON_DST=../../src/qt/res/icons/qtcoin_testnet.ico
convert ${ICON_SRC} -resize 16x16 qtcoin-16.png
convert ${ICON_SRC} -resize 32x32 qtcoin-32.png
convert ${ICON_SRC} -resize 48x48 qtcoin-48.png
convert qtcoin-16.png qtcoin-32.png qtcoin-48.png ${ICON_DST}
rm qtcoin-16.png qtcoin-32.png qtcoin-48.png
