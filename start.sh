#!/bin/bash

# Navigate to the backend directory and start the Django server
echo "Starting Django backend..."
cd nmap-backend 
python3 -m venv venv  # Create a virtual environment 
source venv/bin/activate  # Activate the virtual environment
pip install -r requirements.txt  # Install the required packages
python3 manage.py runserver 0.0.0.0:8000 &  # Run the Django server in the background
DJANGO_PID=$!  # Store the backend process ID

# Navigate to the frontend directory and start the Angular app
echo "Starting Angular frontend..."
cd ../nmap-frontend
npm install  # Install the required packages
npm start &  # Run the Angular app in the background
ANGULAR_PID=$!  # Store the frontend process ID

# Wait for processes to finish or handle termination signals
trap "kill $DJANGO_PID $ANGULAR_PID" SIGINT SIGTERM

echo "Both apps are running. Press Ctrl+C to stop."

# Wait for both processes to complete
wait $DJANGO_PID $ANGULAR_PID
