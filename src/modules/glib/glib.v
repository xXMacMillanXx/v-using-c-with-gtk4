module glib

#flag -I/usr/include/glib-2.0 -L/usr/lib64
#flag -I/lib64/glib-2.0/include -L/usr/lib64
#flag -lglib-2.0
#flag -I/usr/include/glib-2.0/gobject -L/usr/lib64
#flag -lgobject-2.0

pub struct C.g_error {}

fn init() {
	// init module if necessary
}

type G_destroy_notify = voidptr

pub struct Error {
	pub: ref &C.g_error
}

pub fn object(ptr voidptr) Object {
	return Object { unsafe { &C.g_object(ptr) } }
}

pub fn application(ptr voidptr) Application {
	return Application { unsafe { &C.g_application(ptr) } }
}
