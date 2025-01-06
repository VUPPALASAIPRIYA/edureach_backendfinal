# Use Python 3.11 as the base image
FROM python:3.11-slim-buster

# Set the working directory
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Set environment variables for Flask (if .env is used)
# Ensure flask app is specified and Flask runs in production
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV PYTHONUNBUFFERED=1

# Expose the port Flask will run on (default 5000)
EXPOSE 5000

# Start the Flask application
CMD ["flask", "run"]
