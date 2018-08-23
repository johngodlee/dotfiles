#!/bin/bash

# <bitbar.title>Coinbase Prices</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Mustafa Türksavaş</bitbar.author>
# <bitbar.author.github>mustafaturksavas</bitbar.author.github>
# <bitbar.desc>Displays Coinbase buy prices of Bitcoin, Ethereum, Litecoin.</bitbar.desc>
# <bitbar.image>https://media.giphy.com/media/3oEhmKvAlkJHoqalFK/giphy.gif</bitbar.image>
# <bitbar.dependencies>bash, python</bitbar.dependencies>
#
# Based on Cryptocurrency Prices plugin by viiraj (github.com/viiraj).
#
# I hope this plugin provides value for you and if you feel like it, tips are always appreciated.
# Bitcoin: 1MYkRDn8KtGeeQSoiafymPPB3mncVi2rKN
# Ethereum: 0x2F0138E7035d0dB3D5e0B5b3008D8E0746641E09
# Litecoin: LVYrJcvdBmhazNoAtJhBvaSsyY2kWHwraJ

bit_price=$(curl -s -H "CB-Version: 2015-04-08" "https://api.coinbase.com/v2/prices/BTC-USD/buy" | python -c "import sys, json; print(json.load(sys.stdin)['data']['amount'])")

echo "BTC$bit_price"
