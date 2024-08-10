#!/bin/bash

# Script from: https://stackoverflow.com/a/78501628/5498624

# Start Ollama in the background.
/bin/ollama serve &
# Record Process ID.
pid=$!

# Pause for Ollama to start.
sleep 5

echo "🔴 Retrieve LLAMA3 model..."
ollama pull llama3
echo "🟢 Done!"

# Wait for Ollama process to finish.
wait $pid
