# hello world in qt5

Contributions in all forms (code, bug reports, community engagement, localization, etc) are warmly welcomed.

![hello-qt5-b25d33f.png](https://raw.githubusercontent.com/koppi/hello-qt5/main/meta/hello-qt5-b25d33f.png)

## Development activity

![GitHub commit activity](https://img.shields.io/github/commit-activity/w/koppi/hello-qt5)
![GitHub last commit](https://img.shields.io/github/last-commit/koppi/hello-qt5)
![GitHub contributors](https://img.shields.io/github/contributors/koppi/hello-qt5)
[![Makefile CI](https://github.com/koppi/hello-qt5/actions/workflows/main.yml/badge.svg)](https://github.com/koppi/hello-qt5/actions/workflows/main.yml)

## Community

[![Join the chat at https://gitter.im/koppi/hello-qt5](https://badges.gitter.im/koppi/hello-qt5.svg)](https://gitter.im/koppi/hello-qt5?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Testing locally

### Debian / Ubuntu

Clone, build and run ```hello-qt5``` as follows:
```bash
sudo apt -qq -y install -qq gh devscripts equivs lintian
gh repo clone koppi/hello-qt5
cd hello-qt5
mk-build-deps -i -s sudo -t "apt --yes --no-install-recommends"
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

This application is licensed under GNU GPLv2. Please read the [LICENSE](LICENSE) file for further terms and conditions of the license.

## Author

* **Jakob Flierl** - [koppi](https://github.com/koppi)

## Contributors

* 

