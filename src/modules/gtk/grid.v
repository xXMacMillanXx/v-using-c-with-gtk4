module gtk

struct C.gtk_grid {}

fn C.gtk_grid_new() &C.gtk_widget
fn C.gtk_grid_attach(&C.gtk_grid, &C.gtk_widget, int, int, int, int)

pub struct Grid {
	pub: ref &C.gtk_grid
}

pub fn grid_new() Widget {
	return Widget { C.gtk_grid_new() }
}

pub fn grid_attach(grid Grid, child Widget, x int, y int, width int, height int) {
	C.gtk_grid_attach(grid.ref, child.ref, x, y, width, height)
}
