module cairo

#flag -I/usr/include/cairo -L/usr/lib64
#flag -lcairo

pub enum Cairo_content {
	color = C.CAIRO_CONTENT_COLOR
	alpha = C.CAIRO_CONTENT_ALPHA
	color_alpha = C.CAIRO_CONTENT_COLOR_ALPHA
}

pub struct C.cairo_t {}
pub struct C.cairo_surface_t {}

fn C.cairo_create(&C.cairo_surface_t) &C.cairo_t
fn C.cairo_set_source_rgb(&C.cairo_t, f64, f64, f64)
fn C.cairo_paint(&C.cairo_t)
fn C.cairo_destroy(&C.cairo_t)
fn C.cairo_surface_destroy(&C.cairo_surface_t)
fn C.cairo_set_source_surface(&C.cairo_t, &C.cairo_surface_t, f64, f64)
fn C.cairo_rectangle(&C.cairo_t, f64, f64, f64, f64)
fn C.cairo_fill(&C.cairo_t)

pub struct Cairo {
	pub: ref &C.cairo_t
}

pub struct Surface {
	pub: ref &C.cairo_surface_t
}

pub fn create(surface Surface) Cairo {
	return Cairo { C.cairo_create(surface.ref) }
}

pub fn set_source_rgb(cai Cairo, red f64, green f64, blue f64) {
	C.cairo_set_source_rgb(cai.ref, red, green, blue)
}

pub fn paint(cai Cairo) {
	C.cairo_paint(cai.ref)
}

pub fn destroy(cai Cairo) {
	C.cairo_destroy(cai.ref)
}

pub fn surface_destroy(surface Surface) {
	C.cairo_surface_destroy(surface.ref)
}

pub fn set_source_surface(cai Cairo, surface Surface, x f64, y f64) {
	C.cairo_set_source_surface(cai.ref, surface.ref, x, y)
}

pub fn rectangle(cai Cairo, x f64, y f64, width f64, height f64) {
	C.cairo_rectangle(cai.ref, x, y, width, height)
}

pub fn fill(cai Cairo) {
	C.cairo_fill(cai.ref)
}
