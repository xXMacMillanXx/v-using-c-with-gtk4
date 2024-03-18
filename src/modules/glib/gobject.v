module glib

#include "glib-object.h"

pub type G_callback = fn (...voidptr)

fn C.g_signal_connect(&C.gtk_application, &char, G_callback, voidptr)
fn C.g_signal_connect_swapped(&C.gtk_widget, &char, G_callback, voidptr)

pub fn signal_connect(app voidptr, event string, action G_callback, data voidptr) {
	C.g_signal_connect(app, event.str, action, data)
}

pub fn signal_connect_swapped(app voidptr, event string, action G_callback, data voidptr) {
	C.g_signal_connect_swapped(app, event.str, action, data)
}
