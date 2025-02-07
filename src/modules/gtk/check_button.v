module gtk

struct C.gtk_check_button {}

fn C.gtk_check_button_new() &C.gtk_widget
fn C.gtk_check_button_new_with_label(&char) &C.gtk_widget

pub struct CheckButton {
	pub: ref &C.gtk_check_button
}

pub fn check_button_new() Widget {
	return Widget { C.gtk_check_button_new() }
}

pub fn check_button_new_with_label(text string) Widget {
	return Widget { C.gtk_check_button_new_with_label(text.str) }
}
