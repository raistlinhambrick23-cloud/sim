# Pulls the stable base deployment layer of the official Ubuntu image
FROM ubuntu:26.04

# Avoid prompt block deadlocks during automated container building phases
ENV DEBIAN_FRONTEND=noninteractive

# Update repository mirror nodes and provision package layers cleanly
RUN apt-get update && apt-get install -y \
    zenity \
    jq \
    curl \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Automatically copies your custom configurations into the image root layout
COPY system_files/ /

# Enforces execution launch safety permissions for your script
RUN chmod +x /my-custom-os.ks
