module gtk

import glib

struct C.gtk_application {}

fn C.gtk_application_new(&char, glib.G_application_flags) &C.gtk_application
fn C.gtk_application_window_new(&C.gtk_application) &C.gtk_widget

pub struct Application {
	pub: ref &C.gtk_application
}

pub fn (a Application) application() glib.Application {
	return glib.Application { &C.g_application(a.ref) }
}

pub fn (a Application) object() glib.Object {
	return glib.Object { &C.g_object(a.ref) }
}

pub fn application_new(s string, f glib.G_application_flags) Application {
	return Application { C.gtk_application_new(s.str, f) }
}

pub fn application_window_new(app Application) Widget {
	return Widget { C.gtk_application_window_new(app.ref) }
}
