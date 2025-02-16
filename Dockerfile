# Use the official Python image as a base image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libffi-dev \
    libx11-dev \
    libxext-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements.txt file into the container
COPY requirements.txt .

RUN apt-get update && apt-get install -y libpq-dev build-essential

# Upgrade pip and setuptools to avoid potential issues with older versions
RUN pip install --upgrade pip setuptools

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the entry point for the container
ENTRYPOINT ["python", "main.py"]