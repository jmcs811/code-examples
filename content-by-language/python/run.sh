#!/bin/bash
pip install -r requirements.txt
# sed 's/pattern/replacement/flags'
echo "{\"python\": {\"inbound\": \"$(echo $(python3 personalized-inbound-integration.py) | sed 's/\\/\\\\/g' | sed 's/"/\\"/g')\", \
 \"outbound\": \"$(echo $(python3 personalized-outbound-integration.py) | sed 's/\\/\\\\/g' | sed 's/"/\\"/g')\"}}" > results.txt
