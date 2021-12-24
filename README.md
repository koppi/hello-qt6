# hello world in qt5

![hello-qt5-b25d33f.png](https://raw.githubusercontent.com/koppi/hello-qt5/main/meta/hello-qt5-b25d33f.png)

[![Makefile CI](https://github.com/koppi/hello-qt5/actions/workflows/main.yml/badge.svg)](https://github.com/koppi/hello-qt5/actions/workflows/main.yml) [![Join the chat at https://gitter.im/koppi/hello-qt5](https://badges.gitter.im/koppi/hello-qt5.svg)](https://gitter.im/koppi/hello-qt5?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Installation

Clone, build and run hello-qt5 as follows:
```bash
sudo apt-get install gh devscripts qtbase5-dev qtbase5-dev-tools qt5-qmake 
gh repo clone koppi/hello-qt5
cd hello-qt5
dpkg-buildpackage -b -rfakeroot -us -uc
sudo dpkg -i ../hello-qt5*deb
sudo apt -f install
```

Clean the repository the Debian way as follows:
```bash
dpkg-buildpackage -rfakeroot -Tclean
```

## Features

* With Debian packaging and desktop integration.

## License

This application is under GNU GPLv3. Please read the COPYING.txt file for further terms and conditions of the license.

## Author

* **Jakob Flierl** - [koppi](https://github.com/koppi)
