module gtk

import pixbuff

pub struct C.gtk_image {}
pub struct C.g_icon {}
pub struct C.gdk_paintable {}

pub enum Gtk_icon_size {
	inherit = C.GTK_ICON_SIZE_INHERIT
	normal = C.GTK_ICON_SIZE_NORMAL
	large = C.GTK_ICON_SIZE_LARGE
}
pub enum Gtk_image_type {
	empty = C.GTK_IMAGE_EMPTY
	icon_name = C.GTK_IMAGE_ICON_NAME
	g_icon = C.GTK_IMAGE_GICON
	paintable = C.GTK_IMAGE_PAINTABLE
}

fn C.gtk_image_new() &C.gtk_widget
fn C.gtk_image_new_from_file(&char) &C.gtk_widget
fn C.gtk_image_new_from_gicon(&C.g_icon) &C.gtk_widget
fn C.gtk_image_new_from_icon_name(&char) &C.gtk_widget
fn C.gtk_image_new_from_paintable(&C.gdk_paintable) &C.gtk_widget
fn C.gtk_image_new_from_pixbuf(&C.gdk_pixbuf) &C.gtk_widget
fn C.gtk_image_new_from_resource(&char) &C.gtk_widget

fn C.gtk_image_clear(&C.gtk_image)
fn C.gtk_image_get_gicon(&C.gtk_image) &C.g_icon
fn C.gtk_image_get_icon_name(&C.gtk_image) &char
fn C.gtk_image_get_icon_size(&C.gtk_image) Gtk_icon_size
fn C.gtk_image_get_paintable(&C.gtk_image) &C.gdk_paintable
fn C.gtk_image_get_pixel_size(&C.gtk_image) int
fn C.gtk_image_get_storage_type(&C.gtk_image) Gtk_image_type
fn C.gtk_image_set_from_file(&C.gtk_image, &char)
fn C.gtk_image_set_from_gicon(&C.gtk_image, &C.g_icon)
fn C.gtk_image_set_from_icon_name(&C.gtk_image, &char)
fn C.gtk_image_set_from_paintable(&C.gtk_image, &C.gdk_paintable)
fn C.gtk_image_set_from_pixbuf(&C.gtk_image, &C.gdk_pixbuf)
fn C.gtk_image_set_from_resource(&C.gtk_image, &char)
fn C.gtk_image_set_icon_size(&C.gtk_image, Gtk_icon_size)
fn C.gtk_image_set_pixel_size(&C.gtk_image, int)

pub struct Image {
	pub: ref &C.gtk_image
}

pub struct Icon {
	pub: ref &C.g_icon
}

pub struct Paintable {
	pub: ref &C.gdk_paintable
}

pub fn image_new() Widget {
	return Widget { C.gtk_image_new() }
}

pub fn image_new_from_file(file_path string) Widget {
	return Widget { C.gtk_image_new_from_file(file_path.str) }
}

pub fn image_new_from_gicon(icon Icon) Widget {
	return Widget { C.gtk_image_new_from_gicon(icon.ref) }
}

pub fn image_new_from_icon_name(icon_name string) Widget {
	return Widget { C.gtk_image_new_from_icon_name(icon_name.str) }
}

pub fn image_new_from_paintable(paintable Paintable) Widget {
	return Widget { C.gtk_image_new_from_paintable(paintable.ref) }
}

pub fn image_new_from_pixbuf(buffer pixbuff.Pixbuf) Widget {
	return Widget { C.gtk_image_new_from_pixbuf(buffer.ref) }
}

pub fn image_new_from_resource(resource string) Widget {
	return Widget { C.gtk_image_new_from_resource(resource.str) }
}

pub fn image_clear(image Image) {
	C.gtk_image_clear(image.ref)
}

pub fn image_get_gicon(image Image) Icon {
	return Icon { C.gtk_image_get_gicon(image.ref) }
}

pub fn image_get_icon_name(image Image) string {
	return unsafe { cstring_to_vstring(C.gtk_image_get_icon_name(image.ref)) }
}

pub fn image_get_icon_size(image Image) Gtk_icon_size {
	return Gtk_icon_size.from(C.gtk_image_get_icon_size(image.ref)) or { Gtk_icon_size.inherit }
}

pub fn image_get_paintable(image Image) Paintable {
	return Paintable { C.gtk_image_get_paintable(image.ref) }
}

pub fn image_get_pixel_size(image Image) int {
	return C.gtk_image_get_pixel_size(image.ref)
}

pub fn image_get_storage_type(image Image) Gtk_image_type {
	return Gtk_image_type.from(C.gtk_image_get_storage_type(image.ref)) or { Gtk_image_type.empty }
}

pub fn image_set_from_file(image Image, file_path string) {
	C.gtk_image_set_from_file(image.ref, file_path.str)
}

pub fn image_set_from_gicon(image Image, icon Icon) {
	C.gtk_image_set_from_gicon(image.ref, icon.ref)
}

pub fn image_set_from_icon_name(image Image, icon_name string) {
	C.gtk_image_set_from_icon_name(image.ref, icon_name.str)
}

pub fn image_set_from_paintable(image Image, paintable Paintable) {
	C.gtk_image_set_from_paintable(image.ref, paintable.ref)
}

pub fn image_set_from_pixbuf(image Image, pixbuf pixbuff.Pixbuf) {
	C.gtk_image_set_from_pixbuf(image.ref, pixbuf.ref)
}

pub fn image_set_from_resource(image Image, resource string) {
	C.gtk_image_set_from_resource(image.ref, resource.str)
}

pub fn image_set_icon_size(image Image, icon_size Gtk_icon_size) {
	C.gtk_image_set_icon_size(image.ref, icon_size)
}

pub fn image_set_pixel_size(image Image, size int) {
	C.gtk_image_set_pixel_size(image.ref, size)
}
