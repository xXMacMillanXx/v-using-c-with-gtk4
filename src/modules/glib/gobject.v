module glib

#include "glib-object.h"

pub type G_callback = fn (...voidptr)

pub struct C.g_object {}

fn C.g_signal_connect(voidptr, &char, G_callback, voidptr)
fn C.g_signal_connect_swapped(voidptr, &char, G_callback, voidptr)
fn C.g_signal_connect_after(voidptr, &char, G_callback, voidptr)
fn C.g_object_unref(&C.g_object)

pub struct Object {
	pub: ref &C.g_object
}

pub fn signal_connect(app voidptr, event string, action G_callback, data voidptr) {
	C.g_signal_connect(app, event.str, action, data)
}

pub fn signal_connect_swapped(app voidptr, event string, action G_callback, data voidptr) {
	C.g_signal_connect_swapped(app, event.str, action, data)
}

pub fn signal_connect_after(app voidptr, event string, action G_callback, data voidptr) {
	C.g_signal_connect_after(app, event.str, action, data)
}

pub fn object_unref(obj Object) {
	C.g_object_unref(obj.ref)
}
