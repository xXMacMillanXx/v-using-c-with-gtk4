module gtk

fn C.gtk_button_new_with_label(&char) &C.gtk_widget

pub fn button_new_with_label(s string) Widget {
	return Widget { C.gtk_button_new_with_label(s.str) }
}
