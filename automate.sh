#!/bin/bash

# Define the Git repository URL
#REPO_URL="https://github.com/XYZ/repo.git"

# Clone the repository
echo "Cloning the repository from $REPO_URL..."
#git clone $REPO_URL
#if [ $? -ne 0 ]; then
#    echo "Error: Failed to clone the repository."
#    exit 1
#fi

# Change to the repository directory (adjust the directory name as needed)
#cd repo

# Install pytest and run tests
echo "Installing pytest..."
pip3 install pytest
if [ $? -ne 0 ]; then
    echo "Error: Failed to install pytest."
    exit 1
fi

echo "Running tests..."
pytest
if [ $? -ne 0 ]; then
    echo "Error: Tests failed."
    exit 1
fi

# Build the Docker image
echo "Building Docker image..."
docker build -t vengi014/calci .
if [ $? -ne 0 ]; then
    echo "Error: Docker build failed."
    exit 1
fi

# Push the image to Docker Hub
echo "Logging in to Docker Hub..."
docker login -u vengi014
if [ $? -ne 0 ]; then
    echo "Error: Docker login failed."
    exit 1
fi

echo "Pushing the image to Docker Hub..."
docker push vengi014/calci
if [ $? -ne 0 ]; then
    echo "Error: Failed to push the image."
    exit 1
fi

echo "Process completed successfully."

