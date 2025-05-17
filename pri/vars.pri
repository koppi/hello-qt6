APP_NAME                      = "hello-qt6"
APP_LOW_NAME                  = "hello-qt6"
APP_REVERSE_NAME              = "com.github.hello-qt6"
APP_LOW_H_NAME                = ".hello-qt6"
APP_AUTHOR                    = "Jakob Flierl"
APP_COPYRIGHT                 = "(C) 2021-2025 $$APP_AUTHOR"
APP_VERSION                   = "0.0.24"
APP_LONG_NAME                 = "$$APP_NAME $$APP_VERSION"
APP_EMAIL                     = "jakob.flierl@gmail.com"
APP_URL                       = "https://github.com/koppi/hello-qt6"
APP_URL_ISSUES                = "https://github.com/koppi/hello-qt6/issues"
APP_URL_ISSUES_NEW            = "https://github.com/koppi/hello-qt6/issues/new"
APP_URL_DOCUMENTATION         = "https://github.com/koppi/hello-qt6/blob/master/resources/docs/Documentation.md"
APP_USERAGENT                 = "RSS Guard/$$APP_VERSION"
APP_DONATE_URL                = "https://koppi.github.io"

message($$MSG_PREFIX: Welcome hello-qt6 qmake script.)

!versionAtLeast(QT_VERSION, 6.8.3) {
  warning($$MSG_PREFIX: At least Qt \"6.8.3\" is required!!!)
}

isEmpty(USE_WEBENGINE) {
  USE_WEBENGINE = false
  message($$MSG_PREFIX: USE_WEBENGINE variable is not set.)

  qtHaveModule(webenginewidgets) {
    USE_WEBENGINE = true
  }
  else {
    USE_WEBENGINE = false
  }
}