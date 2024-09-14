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
    	uvicorn app:app --host 0.0.0.0 --reload
else
	# Unix (Linux or macOS)
    	source .venv/bin/activate
    	nohup uvicorn app:app --host 0.0.0.0 > /dev/null 2>&1 &
fi

# Deactivate the virtual environment
deactivate