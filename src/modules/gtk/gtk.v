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

pub struct Builder {
	pub: ref &C.gtk_builder
}

// window casts the given pointer `ptr` to a gtk window pointer
// and returns it as a `gtk.Window` struct
pub fn window(ptr voidptr) Window {
	return Window { unsafe { &C.gtk_window(ptr) } }
}

// widget casts the given pointer `ptr` to a gtk widget pointer
// and returns it as a `gtk.Widget` struct
pub fn widget(ptr voidptr) Widget {
	return Widget { unsafe { &C.gtk_widget(ptr) } }
}

// box casts the given pointer `ptr` to a gtk box pointer
// and returns it as a `gtk.Box` struct
pub fn box(ptr voidptr) Box {
	return Box { unsafe { &C.gtk_box(ptr) } }
}

// grid casts the given pointer `ptr` to a gtk grid pointer
// and returns it as a `gtk.Grid` struct
pub fn grid(ptr voidptr) Grid {
	return Grid { unsafe { &C.gtk_grid(ptr) } }
}

// frame casts the given pointer `ptr` to a gtk frame pointer
// and returns it as a `gtk.Frame` struct
pub fn frame(ptr voidptr) Frame {
	return Frame { unsafe { &C.gtk_frame(ptr) } }
}

// drawing_area casts the given pointer `ptr` to a gtk drawing area pointer
// and returns it as a `gtk.DrawingArea` struct
pub fn drawing_area(ptr voidptr) DrawingArea {
	return DrawingArea { unsafe { &C.gtk_drawing_area(ptr) } }
}

// event_controller casts the given pointer `ptr` to a gtk event controller pointer
// and returns it as a `gtk.EventController` struct
pub fn event_controller(ptr voidptr) EventController {
	return EventController { unsafe { &C.gtk_event_controller(ptr) } }
}

// builder_new creates an empty gtk builder and returns it as `gtk.Builder` struct
pub fn builder_new() Builder {
	return Builder{ C.gtk_builder_new() }
}

// builder_add_from_file parses a file containing a UI definition and merges it into the given `gtk.Builder`
// returns true on success and false on error
pub fn builder_add_from_file(builder Builder, filename string, error glib.Error) bool {
	return C.gtk_builder_add_from_file(builder.ref, filename.str, &error.ref)
}

// builder_get_object returns the object with the given `name` from the given `gtk.Builder`
pub fn builder_get_object(builder Builder, name string) glib.Object {
	return glib.Object { C.gtk_builder_get_object(builder.ref, name.str) }
}
