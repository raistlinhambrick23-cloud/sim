# Pulls the stable base layer of Bazzite Gaming OS
FROM ghcr.io/ublue-os/bazzite:stable

# Installs essential background tools required for script execution
RUN rpm-ostree install zenity jq lshw && \
    rpm-ostree cleanup -a

# Automatically copies your custom script folder layout directly into the OS root
COPY system_files/ /

# Sets execution permissions for your exact custom file name
RUN chmod +x /my-custom-os.ks

# Rebuilds core modules cleanly inside the custom image layers
RUN rpm-ostree initramfs --force
