module gtk

import pixbuff

struct C.gtk_image {}

fn C.gtk_image_new() &C.gtk_widget
fn C.gtk_image_set_from_pixbuf(&C.gtk_image, &C.gdk_pixbuf)
fn C.gtk_image_set_pixel_size(&C.gtk_image, int)

pub struct Image {
	pub: ref &C.gtk_image
}

pub fn image_new() Widget {
	return Widget { C.gtk_image_new() }
}

pub fn image_set_from_pixbuf(image Image, pixbuf pixbuff.Pixbuf) {
	C.gtk_image_set_from_pixbuf(image.ref, pixbuf.ref)
}

pub fn image_set_pixel_size(image Image, size int) {
	C.gtk_image_set_pixel_size(image.ref, size)
}
