module gtk

import pixbuff

pub struct C.gtk_picture {}
pub struct C.g_file {}

pub enum Gtk_content_fit {
	fill = C.GTK_CONTENT_FIT_FILL
	contain = C.GTK_CONTENT_FIT_CONTAIN
	cover = C.GTK_CONTENT_FIT_COVER
	scale_down = C.GTK_CONTENT_FIT_SCALE_DOWN
}

fn C.gtk_picture_new() &C.gtk_widget
fn C.gtk_picture_new_for_file(&C.g_file) &C.gtk_widget
fn C.gtk_picture_new_for_filename(&char) &C.gtk_widget
fn C.gtk_picture_new_for_paintable(&C.gdk_paintable) &C.gtk_widget
fn C.gtk_picture_new_for_pixbuf(&C.gdk_pixbuf) &C.gtk_widget
fn C.gtk_picture_new_for_resource(&char) &C.gtk_widget

fn C.gtk_picture_get_alternative_text(&C.gtk_picture) &char
fn C.gtk_picture_get_can_shrink(&C.gtk_picture) bool
fn C.gtk_picture_get_content_fit(&C.gtk_picture) Gtk_content_fit
fn C.gtk_picture_get_file(&C.gtk_picture) &C.g_file
fn C.gtk_picture_get_keep_aspect_ratio(&C.gtk_picture) bool
fn C.gtk_picture_get_paintable(&C.gtk_picture) &C.gdk_paintable
fn C.gtk_picture_set_alternative_text(&C.gtk_picture, &char)
fn C.gtk_picture_set_can_shrink(&C.gtk_picture, bool)
fn C.gtk_picture_set_content_fit(&C.gtk_picture, Gtk_content_fit)
fn C.gtk_picture_set_file(&C.gtk_picture, &C.g_file)
fn C.gtk_picture_set_filename(&C.gtk_picture, &char)
fn C.gtk_picture_set_keep_aspect_ratio(&C.gtk_picture, bool)
fn C.gtk_picture_set_paintable(&C.gtk_picture, &C.gdk_paintable)
fn C.gtk_picture_set_pixbuf(&C.gtk_picture, &C.gdk_pixbuf)
fn C.gtk_picture_set_resource(&C.gtk_picture, &char)

pub struct Picture {
	pub: ref &C.gtk_picture
}

pub struct File {
	pub: ref &C.g_file
}

pub fn picture_new() Widget {
	return Widget { C.gtk_picture_new() }
}

pub fn picture_new_for_file(file File) Widget {
	return Widget { C.gtk_picture_new_for_file(file.ref) }
}

pub fn picture_new_for_filename(file_name string) Widget {
	return Widget { C.gtk_picture_new_for_filename(file_name.str) }
}

pub fn picture_new_for_paintable(paintable Paintable) Widget {
	return Widget { C.gtk_picture_new_for_paintable(paintable.ref) }
}

pub fn picture_new_for_pixbuf(buffer pixbuff.Pixbuf) Widget {
	return Widget { C.gtk_picture_new_for_pixbuf(buffer.ref) }
}

pub fn picture_new_for_resource(resource string) Widget {
	return Widget { C.gtk_picture_new_for_resource(resource.str) }
}

pub fn picture_get_alternative_text(picture Picture) string {
	return unsafe { cstring_to_vstring(C.gtk_picture_get_alternative_text(picture.ref)) }
}

pub fn picture_get_can_shrink(picture Picture) bool {
	return C.gtk_picture_get_can_shrink(picture.ref)
}

pub fn picture_get_content_fit(picture Picture) Gtk_content_fit {
	return Gtk_content_fit.from(C.gtk_picture_get_content_fit(picture.ref)) or { Gtk_content_fit.fill }
}

pub fn picture_get_file(picture Picture) File {
	return File { C.gtk_picture_get_file(picture.ref) }
}

pub fn picture_get_keep_aspect_ratio(picture Picture) bool {
	return C.gtk_picture_get_keep_aspect_ratio(picture.ref)
}

pub fn picture_get_paintable(picture Picture) Paintable {
	return Paintable { C.gtk_picture_get_paintable(picture.ref) }
}

pub fn picture_set_alternative_text(picture Picture, text string) {
	C.gtk_picture_set_alternative_text(picture.ref, text.str)
}

pub fn picture_set_can_shrink(picture Picture, can_shrink bool) {
	C.gtk_picture_set_can_shrink(picture.ref, can_shrink)
}

pub fn picture_set_content_fit(picture Picture, content_fit Gtk_content_fit) {
	C.gtk_picture_set_content_fit(picture.ref, content_fit)
}

pub fn picture_set_file(picture Picture, file File) {
	C.gtk_picture_set_file(picture.ref, file.ref)
}

pub fn picture_set_filename(picture Picture, file_name string) {
	C.gtk_picture_set_filename(picture.ref, file_name.str)
}

pub fn picture_set_keep_aspect_ratio(picture Picture, keep_ratio bool) {
	C.gtk_picture_set_keep_aspect_ratio(picture.ref, keep_ratio)
}

pub fn picture_set_paintable(picture Picture, paintable Paintable) {
	C.gtk_picture_set_paintable(picture.ref, paintable.ref)
}

pub fn picture_set_pixbuf(picture Picture, buffer pixbuff.Pixbuf) {
	C.gtk_picture_set_pixbuf(picture.ref, buffer.ref)
}

pub fn picture_set_resource(picture Picture, resource string) {
	C.gtk_picture_set_resource(picture.ref, resource.str)
}
