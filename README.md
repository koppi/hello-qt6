# hello world in qt5

## Installation

Clone, build and run hello-qt5 as follows:
```bash
sudo apt-get install gh devscripts qtbase5-dev qtbase5-dev-tools qt5-qmake 
gh repo clone koppi/hello-qt5
cd hello-qt5
pkg-buildpackage -b -rfakeroot -us -uc
sudo dpkg -i ../hello-qt5*deb
sudo apt -f install
```

## Features

* With Debian packaging and desktop integration.

## License

This application is under GNU GPLv3. Please read the COPYING.txt file for further terms and conditions of the license.

## Author

* **Jakob Flierl** - [koppi](https://github.com/koppi)
