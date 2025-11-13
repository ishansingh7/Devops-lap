#!/bin/bash
# Cloud-init style bootstrap for the EC2 instance (example) - edit as needed

# Update and install nodejs (from NodeSource) and unzip
apt-get update
apt-get install -y curl wget tar

# Install Node.js (setup for 18.x)
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs build-essential

# Create app user
useradd -m -s /bin/bash ubuntu
mkdir -p /home/ubuntu/app
chown -R ubuntu:ubuntu /home/ubuntu/app

# Install node_exporter (host metrics)
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz -O /tmp/node_exporter.tar.gz
tar -xzf /tmp/node_exporter.tar.gz -C /tmp
cp /tmp/node_exporter-*/node_exporter /usr/local/bin/
useradd --no-create-home --shell /bin/false nodeusr || true

cat > /etc/systemd/system/node_exporter.service <<'EOF'
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=nodeusr
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl enable --now node_exporter

# Placeholder for application deployment; Jenkins will copy files and set up systemd service
echo "Bootstrap complete"
