#! /bin/sh.

# Run ADSB IQ generator Python program
adsb_encoder.py  <ICAO> <Latitude> <Longitude> <Altitude>

# Align IQ output file to 256K buffer size
dd if=Samples.iq8s of=Samples_256K.iq8s bs=4k seek=63

# Transmit signal via hackrf
hackrf_transfer -t Samples_256K.iq8s -f 868000000 -s 2000000 -x 10