module gtk

struct C.gtk_window {}

fn C.gtk_window_set_child(&C.gtk_window, &C.gtk_widget)
fn C.gtk_window_present(&C.gtk_window)
fn C.gtk_window_close(&C.gtk_window)
fn C.gtk_window_set_title(&C.gtk_window, &char)
fn C.gtk_window_set_default_size(&C.gtk_window, int, int)
fn C.gtk_window_destroy(&C.gtk_window)

pub struct Window {
	pub: ref &C.gtk_window
}

pub fn window_set_child(window Window, widget Widget) {
	C.gtk_window_set_child(window.ref, widget.ref)
}

pub fn window_present(window Window) {
	C.gtk_window_present(window.ref)
}

pub fn window_close(window Window) {
	C.gtk_window_close(window.ref)
}

pub fn window_set_title(window Window, title string) {
	C.gtk_window_set_title(window.ref, title.str)
}

pub fn window_set_default_size(window Window, width int, height int) {
	C.gtk_window_set_default_size(window.ref, width, height);
}

pub fn window_destroy(window Window) {
	C.gtk_window_destroy(window.ref)
}
