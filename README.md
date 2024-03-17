# DNS Configuration Bash Script

This Bash script automates the process of configuring DNS settings on Linux systems. It allows users to easily change the default DNS servers, install the necessary services, and ensure that the changes persist across reboots. The script is designed to be flexible and compatible with various Linux distributions, providing color-coded log messages for easy interpretation.

## Why Change DNS Settings Permanently?

Changing DNS settings permanently can improve network performance, enhance security, and provide access to region-restricted or censored content. By setting custom DNS servers, users can bypass DNS hijacking, improve privacy, and mitigate risks associated with DNS-related attacks.

## Usage in Restricted Regions

For users in regions with restricted internet access, such as Iran, changing DNS settings is crucial for accessing uncensored content and services. By using alternative DNS providers like Shecan([shecan.ir](https://shecan.ir/)) or other DNS resolvers, users can circumvent government-imposed restrictions and access services that may be blocked under sanctions.

## Features

- Change default DNS settings in `/etc/resolv.conf`.
- Install and manage the `resolvconf` service.
- Set name servers for `resolvconf`.
- Restart services to apply changes.
- Verify and ensure persistence of DNS settings.

## Usage
To execute the script directly on your server, run the following command:

```bash
curl -sL https://raw.githubusercontent.com/Soroosh0098/permanent-dns/main/permanent_dns.sh | sudo bash
```
Clone the repository and run the script with root privileges. Refer to the README for detailed instructions.

## Contributing

Contributions, bug reports, and suggestions for improvements are welcome! Feel free to open an issue or create a pull request.

## License

This project is licensed under the MIT License.
