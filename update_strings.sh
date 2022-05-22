#!/bin/sh
#
# PROJECT: Python GTK+ Hello World
# DESC: Python GTK+ Hello Update Strings Shell Script
# AUTHOR: Erdem Ersoy
# LICENSE: CC0-1.0

APP_NAME=python-gtk-hello-world
APP_VERSION=1.0

xgettext --default-domain=${APP_NAME} \
         --lang=Python \
         --from-code=utf-8 \
         --output=${APP_NAME}.pot \
         --package-name=${APP_NAME} \
         --package-version=${APP_VERSION} \
         HelloWindow.py

xgettext --default-domain=${APP_NAME} \
         --lang=Glade \
         --from-code=utf-8 \
         --output=${APP_NAME}.pot \
         --package-name=${APP_NAME} \
         --package-version=${APP_VERSION} \
         HelloWindow.glade

msgmerge --lang=en \
         --update \
         locale/en/LC_MESSAGES/${APP_NAME}.po \
         ${APP_NAME}.pot

msgmerge --lang=tr \
         --update \
         locale/tr/LC_MESSAGES/${APP_NAME}.po \
         ${APP_NAME}.pot

msgfmt --check --directory=locale/en/LC_MESSAGES/ \
       --output-file=locale/en/LC_MESSAGES/${APP_NAME}.mo \
       ${APP_NAME}.po \

msgfmt --check --directory=locale/tr/LC_MESSAGES/ \
       --output-file=locale/tr/LC_MESSAGES/${APP_NAME}.mo \
       ${APP_NAME}.po \

