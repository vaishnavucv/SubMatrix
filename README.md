# SubMatrix
A lightweight Bash script for extracting domain names from a certificate database and checking their availability.

# Domain Scanner Script

This script is designed to fetch domains associated with a specific target domain (e.g., `nasa.gov`) from the Certificate Transparency Logs (using crt.sh) and then identify which of these domains are actively responding.

## Prerequisites

### Tools Required:
- **curl**: For fetching data from crt.sh.
- **jq**: For processing and filtering JSON responses.
- **sed**: For text processing.
- **httpx**: For checking active domains.

### Installation:
- **jq**: Install using your package manager (e.g., `sudo apt install jq` for Ubuntu/Debian).
- **httpx**: Install via [Homebrew](https://brew.sh/) or Go:
  ```bash
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
  ```

## Usage

1. Clone the script or copy it into a file (e.g., `scan_domains.sh`).
2. Make the script executable:
   ```bash
   chmod +x scan_domains.sh
   ```
3. Run the script:
   ```bash
   ./scan_domains.sh
   ```

## Script Workflow

1. **Target Domain Setup:**
   The script uses the `TARGET_DOMAIN` variable to specify the domain of interest (e.g., `nasa.gov`).

2. **Fetch Domains:**
   The script queries `crt.sh` to retrieve subdomains of the target domain in JSON format and extracts their names using `jq`. Duplicate entries are removed, and wildcard entries (e.g., `*.example.com`) are cleaned using `sed`.

3. **Filter Active Domains:**
   The extracted domains are checked for activity using `httpx`, and only active domains are saved to a separate file.

4. **Output Files:**
   - **domains.txt**: Contains all the domains retrieved from crt.sh.
   - **alive_domains.txt**: Contains only the domains that are actively responding.

## Files

- **`domains.txt`**: List of all fetched domains from crt.sh.
- **`alive_domains.txt`**: List of domains that are alive (responding).

## Example Output

After running the script, you will see the following messages:

```bash
Fetched domains saved to domains.txt
Active domains saved to alive_domains.txt
```

## Customization

To change the target domain, modify the `TARGET_DOMAIN` variable in the script:
```bash
TARGET_DOMAIN=".yourdomain.com"
```

## Notes

- Ensure you have an active internet connection as the script fetches data from crt.sh.
- Make sure the required tools (`curl`, `jq`, `sed`, `httpx`) are installed and accessible from your PATH.

## Disclaimer

This script is intended for educational and lawful use only. Ensure you have permission to scan domains and comply with all applicable laws and policies.
