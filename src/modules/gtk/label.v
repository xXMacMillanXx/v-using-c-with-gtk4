module gtk

struct C.gtk_label {}

fn C.gtk_label_new(&char) &C.gtk_widget

pub struct Label {
	pub: ref &C.gtk_label
}

pub fn label_new(text string) Widget {
	return Widget { C.gtk_label_new(text.str) }
}
