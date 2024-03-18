module gtk

import glib

#flag -I/usr/include/gtk-4.0 -L/usr/lib64
#flag -lgtk-4
#flag -I/usr/include/gdk-pixbuf-2.0 -L/usr/lib64

#include "gtk/gtk.h"

struct C.gtk {}
struct C.gtk_application {}
struct C.gtk_widget {}
struct C.gtk_window {}
struct C.gtk_box {}

pub enum Gtk_orientation {
	horizontal = 0
	vertical = 1
}
pub enum Gtk_align {
	fill = 0
	start = 1
	end = 2
	center = 3
	baseline_fill = 4
	// baseline = 4
	baseline_center = 5
}

fn C.gtk_application_new(&char, glib.G_application_flags) &C.gtk_application
fn C.gtk_application_window_new(&C.gtk_application) &C.gtk_widget
fn C.gtk_window_set_child(&C.gtk_window, &C.gtk_widget)
fn C.gtk_window_present(&C.gtk_window)
fn C.gtk_button_new_with_label(&char) &C.gtk_widget
fn C.gtk_window_close(&C.gtk_window)
fn C.gtk_window_set_title(&C.gtk_window, &char)
fn C.gtk_window_set_default_size(&C.gtk_window, int, int)
fn C.gtk_box_new(Gtk_orientation, int) &C.gtk_widget
fn C.gtk_widget_set_halign(&C.gtk_widget, Gtk_align)
fn C.gtk_widget_set_valign(&C.gtk_widget, Gtk_align)
fn C.gtk_box_append(&C.gtk_box, &C.gtk_widget)

fn init() {
	// init module if neccessary
}

pub struct Application {
	pub: ref &C.gtk_application
}

pub fn (a Application) application() glib.Application {
	return glib.Application { &C.g_application(a.ref) }
}

pub fn (a Application) object() glib.Object {
	return glib.Object { &C.g_object(a.ref) }
}

pub struct Widget {
	pub: ref &C.gtk_widget
}

pub fn (w Widget) window() Window {
	return Window { &C.gtk_window(w.ref) }
}

pub fn (w Widget) box() Box {
	return Box { &C.gtk_box(w.ref) }
}

pub struct Window {
	pub: ref &C.gtk_window
}

pub struct Box {
	pub: ref &C.gtk_box
}

pub fn application_new(s string, f glib.G_application_flags) Application {
	return Application { C.gtk_application_new(s.str, f) }
}

pub fn application_window_new(app Application) Widget {
	return Widget { C.gtk_application_window_new(app.ref) }
}

pub fn window_set_child(window Window, widget Widget) {
	C.gtk_window_set_child(window.ref, widget.ref)
}

pub fn window_present(window Window) {
	C.gtk_window_present(window.ref)
}

pub fn button_new_with_label(s string) Widget {
	return Widget { C.gtk_button_new_with_label(s.str) }
}

pub fn window_close(window Window) {
	C.gtk_window_close(window.ref)
}

pub fn window_set_title(window Window, title string) {
	C.gtk_window_set_title(window.ref, title.str)
}

pub fn window_set_default_size(window Window, width int, height int) {
	C.gtk_window_set_default_size(window.ref, width, height);
}

pub fn box_new(orientation Gtk_orientation, spacing int) Widget {
	return Widget { C.gtk_box_new(orientation, spacing) }
}

pub fn widget_set_halign(widget Widget, align Gtk_align) {
	C.gtk_widget_set_halign(widget.ref, align)
}

pub fn widget_set_valign(widget Widget, align Gtk_align) {
	C.gtk_widget_set_valign(widget.ref, align)
}

pub fn box_append(box Box, widget Widget) {
	C.gtk_box_append(box.ref, widget.ref)
}
