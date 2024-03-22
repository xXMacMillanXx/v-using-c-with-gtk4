module glib

#flag -I/usr/include/glib-2.0 -L/usr/lib64
#flag -I/lib64/glib-2.0/include -L/usr/lib64
#flag -lglib-2.0
#flag -I/usr/include/glib-2.0/gobject -L/usr/lib64
#flag -lgobject-2.0

fn init() {
	// init module if necessary
}

type G_destroy_notify = voidptr
