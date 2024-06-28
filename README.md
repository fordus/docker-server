# 🖥️ Web Server Configuration Script

This project provides a comprehensive script for setting up a web server environment with Preact, Java, and PostgreSQL using Docker.

## 📋 Table of Contents

- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Usage](#-usage)
- [Directory Structure](#-directory-structure)
- [User Management](#-user-management)
- [Backup](#-backup)
- [Tunnel Configuration](#-tunnel-configuration)
- [Docker Utilities](#-docker-utilities)
- [Security Notice](#-security-notice)

## ✨ Features

- 🐳 Docker and Docker Compose setup
- 🌐 Preact frontend and Java backend configuration
- 🐘 PostgreSQL database setup
- 👥 User and group management
- 🔒 Basic firewall configuration
- 🔄 Automated database backups
- 🚇 Packetriot tunnel support for remote access

## 🧰 Prerequisites

- A Debian-based Linux system (e.g., Ubuntu)
- Root access to the server
- Internet connection for package installation

## 🚀 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/web-server-config.git
   cd web-server-config
   ```

2. Make the script executable:
   ```bash
   chmod +x setup_script.sh
   ```

3. Run the script with root privileges:
   ```bash
   sudo ./setup_script.sh
   ```

## 🖥️ Usage

The script will automatically:

1. Install necessary dependencies
2. Create users and groups
3. Set up directory structure and permissions
4. Configure the firewall
5. Set up automated backups
6. Start the web server using Docker Compose

After running the script, your server will be set up and running.

## 📂 Directory Structure

- `/var/www/frontend`: Frontend files (Preact)
- `/var/www/backend`: Backend files (Java)
- `/var/db`: Database files
- `/backupdb`: Database backups

## 👥 User Management

The script creates the following users:
- `frontend`: For frontend development
- `backend`: For backend development
- `dbadmin`: For database administration
- `sysadmin`: For system administration

**Important**: Change the default passwords after setup!

## 💾 Backup

Database backups are automated using cron, occurring every minute. Backups are stored in `/backupdb`.

## 🚇 Tunnel Configuration

To set up a Packetriot tunnel for remote access:

1. Register at https://packetriot.com/
2. Activate a domain and create a CNAME record pointing to your tunnel server
3. Run:
   ```bash
   docker exec -it tunnel pktriot configure
   docker exec -it tunnel pktriot tunnel http add --domain [custom-domain] --destination frontend --http 80
   docker restart tunnel
   ```

## 🐳 Docker Utilities

To clean up your Docker environment:

```bash
docker rm -f $(docker ps -aq) 
sudo docker rmi -f $(docker images -aq)
docker-compose up --build --force-recreate -d
```

## 🔐 Security Notice

This script sets up a basic configuration. For production use, consider:
- Changing default passwords
- Implementing more stringent firewall rules
- Setting up SSL/TLS certificates
- Regularly updating and patching the system

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
