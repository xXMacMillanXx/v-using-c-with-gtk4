module gtk

struct C.gtk_list_box_row {}

fn C.gtk_list_box_row_new() &C.gtk_widget
fn C.gtk_list_box_row_set_child(&C.gtk_list_box_row, &C.gtk_widget)

pub struct ListBoxRow {
	pub: ref &C.gtk_list_box_row
}

pub fn list_box_row_new() Widget {
	return Widget { C.gtk_list_box_row_new() }
}

pub fn list_box_row_set_child(row ListBoxRow, widget Widget) {
	C.gtk_list_box_row_set_child(row.ref, widget.ref)
}
