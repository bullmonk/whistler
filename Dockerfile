# Set the base image
FROM pytorch/pytorch:latest

# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY ./container/envs.yaml /app/

# Install additional dependencies
# RUN pip install torch-geometric torchvision scikit-learn
RUN ["conda", "env", "create", "-f", "envs.yaml"]
RUN ["conda", "install", "jupyter", "-y", "--quiet"]
RUN ["conda", "install", "-c", "conda-forge", "matplotlib", "-y", "--quiet"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--notebook-dir=/app", "--ip='*'", "--port=8888", \
"--no-browser", "--NotebookApp.token=", "--allow-root"]