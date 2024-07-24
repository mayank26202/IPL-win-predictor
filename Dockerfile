# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . /app

# Make setup.sh executable
RUN chmod +x setup.sh

# Expose the port Streamlit runs on
EXPOSE 8501

# Run the setup script to set up the environment
RUN ./setup.sh

# Run Streamlit app
CMD ["streamlit", "run", "app.py"]
