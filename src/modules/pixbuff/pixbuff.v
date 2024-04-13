module pixbuff

import glib

#flag -I/usr/include/gdk-pixbuf-2.0 -L/usr/lib64

pub struct C.gdk_pixbuf {}
pub struct C.gdk_pixbuf_loader {}

fn C.gdk_pixbuf_loader_new() &C.gdk_pixbuf_loader
fn C.gdk_pixbuf_loader_write_bytes(&C.gdk_pixbuf_loader, &u8, &&C.g_error) bool
fn C.gdk_pixbuf_loader_set_size(&C.gdk_pixbuf_loader, int, int)
fn C.gdk_pixbuf_loader_close(&C.gdk_pixbuf_loader, &&C.g_error) bool
fn C.gdk_pixbuf_loader_get_pixbuf(&C.gdk_pixbuf_loader) &C.gdk_pixbuf
fn C.gdk_pixbuf_new_from_stream(&C.g_input_stream, &C.g_cancellable, &C.g_error) &C.gdk_pixbuf

pub struct Pixbuf {
	pub: ref &C.gdk_pixbuf
}

pub struct PixbufLoader {
	pub: ref &C.gdk_pixbuf_loader
}

pub fn new_from_stream(stream glib.InputStream, cancellable glib.Cancellable, error glib.Error) Pixbuf {
	return Pixbuf { C.gdk_pixbuf_new_from_stream(stream.ref, cancellable.ref, error.ref) }
}

pub fn loader_new() PixbufLoader {
	return PixbufLoader { C.gdk_pixbuf_loader_new() }
}

pub fn loader_write_bytes(loader PixbufLoader, buffer []u8, error glib.Error) bool {
	return C.gdk_pixbuf_loader_write_bytes(loader.ref, &buffer, error.ref)
}

pub fn loader_set_size(loader PixbufLoader, width int, height int) {
	C.gdk_pixbuf_loader_set_size(loader.ref, width, height)
}

pub fn loader_close(loader PixbufLoader, error glib.Error) bool {
	return C.gdk_pixbuf_loader_close(loader.ref, error.ref)
}

pub fn loader_get_pixbuf(loader PixbufLoader) Pixbuf {
	return Pixbuf { C.gdk_pixbuf_loader_get_pixbuf(loader.ref) }
}
