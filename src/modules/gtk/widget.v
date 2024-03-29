module gtk

struct C.gtk_widget {}
struct C.gtk_event_controller {}

fn C.gtk_widget_set_halign(&C.gtk_widget, Gtk_align)
fn C.gtk_widget_set_valign(&C.gtk_widget, Gtk_align)
fn C.gtk_widget_get_native(&C.gtk_widget) &C.gtk_native
fn C.gtk_widget_get_width(&C.gtk_widget) int
fn C.gtk_widget_get_height(&C.gtk_widget) int
fn C.gtk_widget_queue_draw(&C.gtk_widget)
fn C.gtk_widget_set_size_request(&C.gtk_widget, int, int)
fn C.gtk_widget_add_controller(&C.gtk_widget, &C.gtk_event_controller)
fn C.gtk_widget_set_visible(&C.gtk_widget, bool)

pub struct Widget {
	pub: ref &C.gtk_widget
}

pub struct EventController {
	pub: ref &C.gtk_event_controller
}

pub fn widget_set_halign(widget Widget, align Gtk_align) {
	C.gtk_widget_set_halign(widget.ref, align)
}

pub fn widget_set_valign(widget Widget, align Gtk_align) {
	C.gtk_widget_set_valign(widget.ref, align)
}

pub fn widget_get_native(widget Widget) Native {
	return Native { C.gtk_widget_get_native(widget.ref) }
}

pub fn widget_get_width(widget Widget) int {
	return C.gtk_widget_get_width(widget.ref)
}

pub fn widget_get_height(widget Widget) int {
	return C.gtk_widget_get_height(widget.ref)
}

pub fn widget_queue_draw(widget Widget) {
	C.gtk_widget_queue_draw(widget.ref)
}

pub fn widget_set_size_request(widget Widget, width int, height int) {
	C.gtk_widget_set_size_request(widget.ref, width, height)
}

pub fn widget_add_controller(widget Widget, controller EventController) {
	C.gtk_widget_add_controller(widget.ref, controller.ref)
}

pub fn widget_set_visible(widget Widget, visible bool) {
	C.gtk_widget_set_visible(widget.ref, visible)
}
