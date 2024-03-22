module gtk

struct C.gtk_frame {}

fn C.gtk_frame_new(&char) &C.gtk_widget
fn C.gtk_frame_set_child(&C.gtk_frame, &C.gtk_widget)

pub struct Frame {
	pub: ref &C.gtk_frame
}

pub fn frame_new(label string) Widget {
	return Widget { C.gtk_frame_new(label.str) }
}

pub fn frame_set_child(frame Frame, widget Widget) {
	C.gtk_frame_set_child(frame.ref, widget.ref);
}
