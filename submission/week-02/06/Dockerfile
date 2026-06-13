FROM python:3.12-slim

WORKDIR /app

# Create a non-root user and group
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Copy server.py into the container
COPY server.py .

# Change ownership of the app directory
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Expose port (documentation only)
EXPOSE 8000

# Exec-form CMD
CMD ["python", "server.py"]
