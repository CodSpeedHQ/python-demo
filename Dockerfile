# Use the official Python image from the Docker Hub
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY --chown=root:root . .

# Set the RUNNER_VERSION environment variable
ENV RUNNER_VERSION=3.2.1

# Install the CodSpeed runner
RUN curl -fsSL https://github.com/CodSpeedHQ/runner/releases/download/v$RUNNER_VERSION/codspeed-runner-installer.sh | sh -s
