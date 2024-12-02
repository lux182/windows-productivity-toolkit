# Directory QR Share

## Description
A Windows utility that allows you to right-click on a directory and generate a QR code linking to a local Python server sharing that directory. Quickly and easily share directory contents across devices on the same network.

## Features
- Generate QR code for directory sharing
- Lightweight Python HTTP server
- Easy right-click context menu integration
- Cross-device directory access

## Prerequisites
- Windows 10 or later
- Python 3.8+
- pip package manager

## Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/directory-qr-share.git
```

2. Install dependencies
```bash
pip install -r requirements.txt
```

3. Install context menu integration
```bash
python install_context_menu.py
```

## Usage

### Generating QR Code
1. Right-click on any directory
2. Select "Generate Directory QR"
3. A QR code will be generated linking to the local server

### Accessing Shared Directory
1. Scan the QR code with a mobile device
2. Ensure both devices are on the same network
3. Browse directory contents through the web interface

```python
# Example usage
from directory_qr_share import server, qr_generator

# Start sharing a directory
server.start_sharing('/path/to/directory')
qr_code = qr_generator.create_qr_link()
```

## Security
- Temporary local network sharing
- No external internet exposure
- Works only on the same network

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/NetworkShareEnhancement`)
3. Commit your changes (`git commit -m 'Add network sharing feature'`)
4. Push to the branch (`git push origin feature/NetworkShareEnhancement`)
5. Open a Pull Request

## License
Distributed under the MIT License. See `LICENSE` for more information.

