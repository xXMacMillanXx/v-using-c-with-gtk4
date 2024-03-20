module gtk

struct C.gtk_widget {}

fn C.gtk_widget_set_halign(&C.gtk_widget, Gtk_align)
fn C.gtk_widget_set_valign(&C.gtk_widget, Gtk_align)

pub struct Widget {
	pub: ref &C.gtk_widget
}

pub fn (w Widget) window() Window {
	return Window { &C.gtk_window(w.ref) }
}

pub fn (w Widget) box() Box {
	return Box { &C.gtk_box(w.ref) }
}

pub fn (w Widget) grid() Grid {
	return Grid { &C.gtk_grid(w.ref) }
}

pub fn widget_set_halign(widget Widget, align Gtk_align) {
	C.gtk_widget_set_halign(widget.ref, align)
}

pub fn widget_set_valign(widget Widget, align Gtk_align) {
	C.gtk_widget_set_valign(widget.ref, align)
}
