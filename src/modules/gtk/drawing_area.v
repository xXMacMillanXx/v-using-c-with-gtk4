module gtk

import glib

type Gtk_drawing_area_draw_func = fn (&C.gtk_drawing_area, &C.cairo_t, int, int, voidptr)

struct C.gtk_drawing_area {}

fn C.gtk_drawing_area_new() &C.gtk_widget
fn C.gtk_drawing_area_set_draw_func(&C.gtk_drawing_area, Gtk_drawing_area_draw_func, voidptr, glib.G_destroy_notify)

pub struct DrawingArea {
	pub: ref &C.gtk_drawing_area
}

pub fn drawing_area_new() Widget {
	return Widget { C.gtk_drawing_area_new() }
}

pub fn drawing_area_set_draw_func(area DrawingArea, action Gtk_drawing_area_draw_func, data voidptr, dest glib.G_destroy_notify) {
	C.gtk_drawing_area_set_draw_func(area.ref, action, data, dest)
}
