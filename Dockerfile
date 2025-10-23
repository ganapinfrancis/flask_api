# Step 1: Use an official Python image
FROM python:3.12-slim

# Step 2: Set working directory inside the container
WORKDIR /app

# Step 3: Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy the rest of your application code
COPY . .

# Step 5: Expose the port your Flask app will run on
EXPOSE 8080

# Step 6: Start the Flask app using Gunicorn
# 'app:app' means the file is app.py and Flask app object is 'app'
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
