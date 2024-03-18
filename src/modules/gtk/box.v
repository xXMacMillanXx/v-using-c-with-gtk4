module gtk

struct C.gtk_box {}

fn C.gtk_box_new(Gtk_orientation, int) &C.gtk_widget
fn C.gtk_box_append(&C.gtk_box, &C.gtk_widget)

pub struct Box {
	pub: ref &C.gtk_box
}

pub fn box_new(orientation Gtk_orientation, spacing int) Widget {
	return Widget { C.gtk_box_new(orientation, spacing) }
}

pub fn box_append(box Box, widget Widget) {
	C.gtk_box_append(box.ref, widget.ref)
}
