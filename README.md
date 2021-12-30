# hello world in qt5

Contributions in all forms (code, bug reports, community engagement, localization, etc) are warmly welcomed.

![hello-qt5-869f3ba.png](https://raw.githubusercontent.com/koppi/hello-qt5/main/meta/hello-qt5-869f3ba.png)

## Development activity

![GitHub commit activity](https://img.shields.io/github/commit-activity/w/koppi/hello-qt5)
![GitHub last commit](https://img.shields.io/github/last-commit/koppi/hello-qt5)
![GitHub contributors](https://img.shields.io/github/contributors/koppi/hello-qt5)
[![Ubuntu](https://github.com/koppi/hello-qt5/actions/workflows/main.yml/badge.svg)](https://github.com/koppi/hello-qt5/actions/workflows/main.yml)

## Insights

[![GitHub issues](https://img.shields.io/github/issues/koppi/hello-qt5)](https://github.com/koppi/hello-qt5/issues)
[![GitHub forks](https://img.shields.io/github/forks/koppi/hello-qt5)](https://github.com/koppi/hello-qt5/network)
[![GitHub stars](https://img.shields.io/github/stars/koppi/hello-qt5)](https://github.com/koppi/hello-qt5/stargazers)
[![GitHub license](https://img.shields.io/github/license/koppi/hello-qt5)](https://github.com/koppi/hello-qt5/blob/main/LICENSE)

## Community

[![project chat](https://img.shields.io/badge/zulip-join_chat-brightgreen.svg)](https://koppi.zulipchat.com/)

## TODO
- [ ] Automatic MacOS release
- [ ] Automatic Windows release
- [ ] Localization for 42 more languages

## Testing locally

### Debian / Ubuntu

Clone, build and run ```hello-qt5``` as follows:
```bash
sudo apt -qq -y install gh devscripts equivs
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

### MacOS

Please contribute.

### Windows

Please contribute.

## Features

* With Debian packaging and desktop integration,
* [multi language](https://wiki.qt.io/How_to_create_a_multi_language_application) application.

## License

```hello-qt5``` is licensed under [GNU GPLv2](LICENSE).

## Author

* **Jakob Flierl** - [koppi](https://github.com/koppi)

## Contributors

* 

