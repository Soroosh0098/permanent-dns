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

## Download or Execute
To execute the script directly on your server, run the following command:

```bash
curl -sL https://raw.githubusercontent.com/Soroosh0098/permanent-dns/main/permanent_dns.sh | sudo bash
```

To download the script, you can use either `curl` or `wget`. Run one of the following commands in your terminal:

Using `curl`:
```bash
curl -o permanent_dns.sh -L https://raw.githubusercontent.com/Soroosh0098/permanent-dns/main/permanent_dns.sh
```
Using `wget`:
```bash
wget https://raw.githubusercontent.com/Soroosh0098/permanent-dns/main/permanent_dns.sh -O permanent_dns.sh
```
Usage
-----

1. Make the script executable:

    ```bash
    chmod +x permanent_dns.sh
    ```

2. Open the script in a text editor such as nano or vim:

    ```bash
    nano permanent_dns.sh
    ```

3. Locate the `DNS_SERVERS` variable near the beginning of the script and modify it according to your needs. For example, to revert to the initial DNS setup, you can set it to `127.0.0.53`. If you want to use custom DNS servers, replace the IP addresses with your desired DNS servers.

4. Save the changes and exit the text editor.

5. Run the script with root privileges:

    ```bash
    sudo ./permanent_dns.sh
    ```

Reverting to Initial DNS Setup
------------------------------

If you need to revert to your initial system DNS setup, follow these steps:

1. Open a terminal on your Linux system.

2. Navigate to the directory where the script is located or download the script again using the instructions provided above.

3. Make the script executable:

    ```bash
    chmod +x permanent_dns.sh
    ```

4. Open the script in a text editor:

    ```bash
    nano permanent_dns.sh
    ```

5. Locate the `DNS_SERVERS` variable near the beginning of the script and set it to `127.0.0.53`.

6. Save the changes and exit the text editor.

7. Run the script with root privileges:

    ```bash
    sudo ./permanent_dns.sh
    ```
    
## Contributing

Contributions, bug reports, and suggestions for improvements are welcome! Feel free to open an issue or create a pull request.

## License

This project is licensed under the MIT License.
