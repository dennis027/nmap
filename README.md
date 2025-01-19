# Nmap Angular and Django App

This repository contains a dual-application system that integrates an Angular-based frontend with a Django-powered backend to provide a user-friendly interface for Nmap network scanning and analysis.

## Overview
The project leverages:
- **Django (Backend)**: Manages network scan requests, processes data, and serves the API.
- **Angular (Frontend)**: Provides an interactive and dynamic interface for users to initiate scans and view results.

## Features
- Perform detailed Nmap scans directly from the interface.
- View real-time scan progress and results.
- Filter and sort scan outputs for better analysis.

## Project Structure
```
project-folder/
|-- nmap-app-backend/      # Django backend application
|-- nmap-app-frontend/     # Angular frontend application
|-- start.sh               # Script to start both applications
|-- Dockerfile             # Dockerfile to containerize the project
```

## Prerequisites
Before running the applications, ensure the following are installed:
- **Python 3.8 or higher**: For the Django backend.
- **Node.js (v20)**: For the Angular frontend.
- **Nmap**: To perform network scans.
- **Docker (optional)**: To run the application in containers.

## Installation and Setup

### Backend (Django)
1. Navigate to the backend directory:
   ```bash
   cd nmap-app-backend
   ```
2. Create and activate a virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Run database migrations:
   ```bash
   python manage.py migrate
   ```
5. Start the Django development server:
   ```bash
   python manage.py runserver 0.0.0.0:8000
   ```

### Frontend (Angular)
1. Navigate to the frontend directory:
   ```bash
   cd ../nmap-app-frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the Angular development server:
   ```bash
   npm start
   ```

### Running with Docker
1. Build the Docker image:
   ```bash
   docker build -t nmap-app .
   ```
2. Run the container:
   ```bash
   docker run -p 8000:8000 -p 4200:4200 nmap-app
   ```

## Usage
- **Access the Frontend**: Navigate to [http://localhost:4200](http://localhost:4200).
- **Access the Backend**: Navigate to [http://localhost:8000](http://localhost:8000).

## File Descriptions

### `nmap-app-backend`
Contains the Django application, including:
- `manage.py`: Django’s command-line utility.
- `requirements.txt`: Python dependencies.
- Core application logic for handling Nmap scan requests and responses.

### `nmap-app-frontend`
Contains the Angular application, including:
- `src/`: Source code for the Angular app.
- `package.json`: Node.js dependencies.

### `start.sh`
A script to automate the startup of both backend and frontend applications. It:
- Sets up and activates a Python virtual environment for Django.
- Installs required npm packages for Angular.
- Starts both applications.

## Contributing
We welcome contributions to improve this project:
1. Fork the repository.
2. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature"
   ```
4. Push to your fork:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

## Troubleshooting
- **Backend Issues**: Ensure all Python dependencies are installed and the database is properly migrated.
- **Frontend Issues**: Verify that Node.js and npm are installed and functional.
- **Port Conflicts**: Modify the default ports in `start.sh` or `Dockerfile` if needed.

## License
This project is licensed under the MIT License.

## Future Improvements
- Add detailed Nmap scan configurations via the UI.
- Enhance real-time updates for ongoing scans.
- Improve error handling and logging.

## Contact
For any queries, reach out to [your-email@example.com].
