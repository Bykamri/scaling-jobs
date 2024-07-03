#!/bin/bash

echo "Welcome to the Jobs Finder project runner"

# Function to run the React (Vite) project
run_react() {
    echo "Starting React (Vite) project..."
    cd frontend  # Replace with your React project directory
    npm run dev
}

# Function to install dependencies and then run the React (Vite) project
install_and_run_react() {
    echo "Installing React (Vite) dependencies..."
    cd frontend  # Replace with your React project directory
    npm install
    run_react
}

# Function to run the Golang project
run_golang() {
    echo "Starting Golang project..."
    cd backend  # Replace with your Golang project directory
    go run main.go
}

# Function to install dependencies (if any) and then run the Golang project
install_and_run_golang() {
    echo "Installing Golang dependencies..."
    cd backend  # Replace with your Golang project directory
    # Add any dependency installation commands here, if needed
    run_golang
}

# Ask user for choice: Install and run both projects, or just run both projects
echo "Do you want to (I)nstall dependencies and run both projects or just (R)un both projects without install? (I/R)"
read -r choice

# Process user choice
case "$choice" in
    I|i)
        echo "Installing dependencies and running both projects..."
        
        echo "Installing React (Vite) dependencies..."
        cd react_project_directory  # Replace with your React project directory
        npm install &
        
        echo "Installing Golang dependencies..."
        cd golang_project_directory  # Replace with your Golang project directory
        # Add any dependency installation commands here, if needed
        
        wait  # Wait for both installations to finish
        
        echo "Starting React (Vite) project..."
        run_react &
        
        echo "Starting Golang project..."
        run_golang &
        
        wait  # Wait for both processes to finish
        ;;
    R|r)
        echo "Running both projects without installing dependencies..."
        echo "Starting React (Vite) project..."
        run_react &
        
        echo "Starting Golang project..."
        run_golang &
        
        wait  # Wait for both processes to finish
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac