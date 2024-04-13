module gtk

import glib

struct C.gtk_application {}

fn C.gtk_application_new(&char, glib.G_application_flags) &C.gtk_application
fn C.gtk_application_window_new(&C.gtk_application) &C.gtk_widget

pub struct Application {
	pub: ref &C.gtk_application
}

// maybe I have to explicitly cast the enum to an int?
pub fn application_new(s string, f glib.G_application_flags) Application {
	return Application { C.gtk_application_new(s.str, f) }
}

pub fn application_window_new(app Application) Widget {
	return Widget { C.gtk_application_window_new(app.ref) }
}
