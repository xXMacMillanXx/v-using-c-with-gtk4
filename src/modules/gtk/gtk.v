module gtk

// import gdk
// import glib
// import cairo

#flag -I/usr/include/gtk-4.0 -L/usr/lib64
#flag -lgtk-4
#flag -I/usr/include/gdk-pixbuf-2.0 -L/usr/lib64

#include "gtk/gtk.h"

struct C.gtk {}

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

fn init() {
	// init module if neccessary
}
