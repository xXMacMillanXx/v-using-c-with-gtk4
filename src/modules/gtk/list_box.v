module gtk

struct C.gtk_list_box {}

fn C.gtk_list_box_prepend(&C.gtk_list_box, &C.gtk_widget)
fn C.gtk_list_box_append(&C.gtk_list_box, &C.gtk_widget)
fn C.gtk_list_box_insert(&C.gtk_list_box, &C.gtk_widget, int)

pub struct ListBox {
	pub: ref &C.gtk_list_box
}

pub fn list_box_prepend(listbox ListBox, widget Widget) {
	C.gtk_list_box_prepend(listbox.ref, widget.ref)
}

pub fn list_box_append(listbox ListBox, widget Widget) {
	C.gtk_list_box_append(listbox.ref, widget.ref)
}

pub fn list_box_insert(listbox ListBox, widget Widget, index int) {
	C.gtk_list_box_insert(listbox.ref, widget.ref, index)
}
