module gtk

import gdk

struct C.gtk_native {}

fn C.gtk_native_get_surface(&C.gtk_native) &C.gdk_surface

pub struct Native {
	pub: ref &C.gtk_native
}

pub fn native_get_surface(nat Native) gdk.Surface {
	return gdk.Surface { C.gtk_native_get_surface(nat.ref) }
}
