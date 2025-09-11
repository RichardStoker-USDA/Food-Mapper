FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app files
COPY app.py .

# Create a non-root user
RUN useradd -m -u 1000 user && chown -R user:user /app
USER user

# Set environment variables
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH \
    PYTHONUNBUFFERED=1 \
    SHINY_HOST=0.0.0.0 \
    SHINY_PORT=7860

# Expose the port
EXPOSE 7860

# Run the Shiny app
CMD ["shiny", "run", "app.py", "--host", "0.0.0.0", "--port", "7860"]