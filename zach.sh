#!/bin/bash

### Customize these two lines!!
export APIKEY=YOURAPIKEYHERE
export URL=YOURURLHERE

# Output files
WAVFILE=${1/m4a/wav}
TRANSCRIPT=${1/m4a/json}
TRANSCRIPT=${TRANSCRIPT/audio/transcripts}

# Convert to wav
ffmpeg -i $1 $WAVFILE

# Perform transcription
curl -X POST -u apikey:$APIKEY --header "Content-Type: audio/wav" --data-binary @$WAVFILE "$URL/v1/recognize?model=es-MX_BroadbandModel" > $TRANSCRIPT

# Convert to txt
python convert_to_txt.py $TRANSCRIPT

