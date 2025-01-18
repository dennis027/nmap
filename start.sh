# #!/bin/bash

# # Navigate to the backend directory and start the Django server
# echo "Starting Django backend..."
# cd nmap-backend 
# python3 -m venv venv  # Create a virtual environment 
# source venv/bin/activate  # Activate the virtual environment
# pip install -r requirements.txt  # Install the required packages
# python3 manage.py runserver 0.0.0.0:8000 &  # Run the Django server in the background
# DJANGO_PID=$!  # Store the backend process ID

# # Navigate to the frontend directory and start the Angular app
# echo "Starting Angular frontend..."
# cd ../nmap-frontend
# npm install  # Install the required packages
# npm start &  # Run the Angular app in the background
# ANGULAR_PID=$!  # Store the frontend process ID

# # Wait for processes to finish or handle termination signals
# trap "kill $DJANGO_PID $ANGULAR_PID" SIGINT SIGTERM

# echo "Both apps are running. Press Ctrl+C to stop."

# # Wait for both processes to complete
# wait $DJANGO_PID $ANGULAR_PID

#!/bin/bash

# Install Python, pip, and build tools
echo "Installing Python and pip..."
apk add --no-cache python3 py3-pip python3-dev build-base

# Install Node.js and npm
echo "Installing Node.js and npm..."
apk add --no-cache nodejs npm

# Install Angular CLI globally (replace <YOUR_ANGULAR_VERSION> with the specific version if needed)
echo "Installing Angular CLI..."
npm install -g @angular/cli@18.2.12

# Navigate to the backend directory and set up the Django backend
echo "Setting up Django backend..."
cd nmap-backend
python3 -m venv venv  # Create a virtual environment
source venv/bin/activate  # Activate the virtual environment
pip install -r requirements.txt  # Install the required packages
python3 manage.py runserver 0.0.0.0:8000 &  # Run the Django server in the background
DJANGO_PID=$!  # Store the backend process ID

# Navigate to the frontend directory and set up the Angular frontend
echo "Setting up Angular frontend..."
cd ../nmap-frontend
npm install  # Install the required npm packages
npm start &  # Start the Angular app in the background
ANGULAR_PID=$!  # Store the frontend process ID

# Handle termination signals and ensure cleanup
trap "echo 'Stopping services...'; kill $DJANGO_PID $ANGULAR_PID" SIGINT SIGTERM

echo "Both apps are running. Press Ctrl+C to stop."

# Wait for both processes to finish
wait $DJANGO_PID $ANGULAR_PID
