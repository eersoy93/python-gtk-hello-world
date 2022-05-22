#!/usr/bin/env python3
#
# PROJECT: Python GTK+ Hello World
# DESC: Python GTK+ Hello Application Script
# AUTHOR: Erdem Ersoy
# LICENSE: CC0-1.0

import sys

import gi
gi.require_version("Gtk", "3.0")
gi.require_version("Gio", "2.0")
from gi.repository import Gtk, Gio

from HelloWindow import HelloWindow


class Hello(Gtk.Application):
    def __init__(self, application_id, flags):
        super().__init__(application_id=application_id,
                         flags=flags)
        self.connect("activate", self.open_window)

    def open_window(self, app):
        self.window = HelloWindow(self)

def main():
    app = Hello("net.erdemersoy.python-gtk-hello-world",
                Gio.ApplicationFlags.FLAGS_NONE)
    return app.run()

if __name__ == "__main__":
    exit_status = main()
    sys.exit(exit_status)
