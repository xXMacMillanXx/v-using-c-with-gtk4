module gdk

import cairo

pub const(
	gdk_button_primary = 1
	gdk_button_secondary = 2
	gdk_button_middle = 3
)

pub struct C.gdk_surface {}

fn C.gdk_surface_create_similar_surface(&C.gdk_surface, cairo.Cairo_content, int, int) &C.cairo_surface_t

pub struct Surface {
    pub: ref &C.gdk_surface
}

pub fn surface_create_similar_surface(surf Surface, content cairo.Cairo_content, width int, height int) cairo.Surface {
	return cairo.Surface { C.gdk_surface_create_similar_surface(surf.ref, content, width, height) }
}
