# Pulls the stable base layer of Bazzite Gaming OS
FROM ghcr.io/ublue-os/bazzite:stable

# Installs essential background tools required for localized script execution
RUN rpm-ostree install zenity jq lshw && \
    rpm-ostree cleanup -a

# Automatically copies your os.ks blueprint layout directly into the distribution architecture
COPY system_files/ /

# Sets execution security permissions for your system automation assets
RUN chmod +x /os.ks

# Rebuilds core modules cleanly inside the custom image layers
RUN rpm-ostree initramfs --force
