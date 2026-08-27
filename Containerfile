# Pulls the stable base layer of the official Ubuntu image
FROM ubuntu:26.04

# Avoid prompt deadlocks during container construction phases
ENV DEBIAN_FRONTEND=noninteractive

# Update the mirrors and install core utility background dependencies
RUN apt-get update && apt-get install -y \
    zenity \
    jq \
    curl \
    wget \
    && apt-get clean \
    rm -rf /var/lib/apt/lists/*

# Automatically copy your custom system configuration scripts inside
COPY system_files/ /

# Sets execution permissions for your custom kickstart automation script name
RUN chmod +x /my-custom-os.ks
