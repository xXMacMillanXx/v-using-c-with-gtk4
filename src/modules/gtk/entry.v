module gtk

struct C.gtk_entry {}

fn C.gtk_entry_get_buffer(&C.gtk_entry) &C.gtk_entry_buffer
fn C.gtk_entry_set_buffer(&C.gtk_entry, &C.gtk_entry_buffer)

pub struct Entry {
	pub: ref &C.gtk_entry
}

pub fn entry_set_buffer(entry Entry, buffer string) {
	C.gtk_entry_set_buffer(entry.ref, C.gtk_entry_buffer_new(buffer.str, buffer.len))
}

pub fn entry_get_buffer(entry Entry) string {
	return unsafe { cstring_to_vstring(C.gtk_entry_buffer_get_text(C.gtk_entry_get_buffer(entry.ref))) }
}
