module gtk

// import gdk
import glib
// import cairo

#flag -I/usr/include/gtk-4.0 -L/usr/lib64
#flag -lgtk-4
#flag -I/usr/include/gdk-pixbuf-2.0 -L/usr/lib64

#include "gtk/gtk.h"

struct C.gtk {}
struct C.gtk_builder {}

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

fn C.gtk_builder_new() &C.gtk_builder
fn C.gtk_builder_add_from_file(&C.gtk_builder, &char, &&C.g_error) bool
fn C.gtk_builder_get_object(&C.gtk_builder, &char) &C.g_object

fn init() {
	// init module if neccessary
}

pub struct GtkBuilder {
	pub: ref &C.gtk_builder
}

pub fn window(ptr voidptr) Window {
	return Window { unsafe { &C.gtk_window(ptr) } }
}

pub fn widget(ptr voidptr) Widget {
	return Widget { unsafe { &C.gtk_widget(ptr) } }
}

pub fn builder_new() GtkBuilder {
	return GtkBuilder{ C.gtk_builder_new() }
}

pub fn builder_add_from_file(builder GtkBuilder, filename string, error glib.Error) bool {
	return C.gtk_builder_add_from_file(builder.ref, filename.str, &error.ref)
}

pub fn builder_get_object(builder GtkBuilder, name string) glib.Object {
	return glib.Object { C.gtk_builder_get_object(builder.ref, name.str) }
}
