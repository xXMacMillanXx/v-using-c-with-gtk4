module gtk

struct C.gtk_text {}
struct C.gtk_entry_buffer {}

fn C.gtk_text_set_buffer(&C.gtk_text, &C.gtk_entry_buffer)
fn C.gtk_entry_buffer_new(&char, int) &C.gtk_entry_buffer
fn C.gtk_text_get_buffer(&C.gtk_text) &C.gtk_entry_buffer
fn C.gtk_entry_buffer_get_text(&C.gtk_entry_buffer) &char

pub struct Text {
	pub: ref &C.gtk_text
}

pub fn text_set_buffer(text Text, buffer string) {
	C.gtk_text_set_buffer(text.ref, C.gtk_entry_buffer_new(buffer.str, buffer.len))
}

pub fn text_get_buffer(text Text) string {
	return unsafe { cstring_to_vstring(C.gtk_entry_buffer_get_text(C.gtk_text_get_buffer(text.ref))) }
}
