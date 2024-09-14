#!/bin/bash

# Check if .venv directory exists
if [ ! -d ".venv" ]; then
	echo "Creating virtual environment..."
	python3 -m venv .venv
	pip install -r requirements.txt
fi

# Activate the virtual environment (cross-platform)
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
	# Windows (Git Bash or Cygwin)
    	source .venv/Scripts/activate
    	waitress-serve --port 8081 app:app
else
	# Unix (Linux or macOS)
    	source .venv/bin/activate
    	nohup waitress-serve --port 8081 app:app > /dev/null 2>&1 &
fi

# Deactivate the virtual environment
deactivate