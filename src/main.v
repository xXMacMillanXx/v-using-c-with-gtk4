module main

import gtk
import glib
import os

#flag -I/usr/include/cairo -L/usr/lib64
#flag -lcairo
#flag -I/usr/include/pango-1.0 -L/usr/lib64
#flag -lpango-1.0
#flag -I/usr/include/harfbuzz -L/usr/lib64
#flag -lharfbuzz
#flag -I/usr/include/graphene-1.0 -L/usr/lib64
#flag -I/lib64/graphene-1.0/include -L/usr/lib64
#flag -lgraphene-1.0

fn print_hello() {
	println('Hello World!')
}

fn on_activate(app gtk.Application) {
	window := gtk.application_window_new(app)
	mut button := gtk.button_new_with_label('Button 1')
	//box := gtk.box_new(gtk.Gtk_orientation.vertical, 0)
	grid := gtk.grid_new()

	gtk.window_set_title(window.window(), 'My App')
	gtk.window_set_default_size(window.window(), 320, 240)

	//gtk.widget_set_halign(box, gtk.Gtk_align.center)
	//gtk.widget_set_valign(box, gtk.Gtk_align.center)
	
	//gtk.window_set_child(window.window(), box)

	gtk.window_set_child(window.window(), grid)
	
	glib.signal_connect(button.ref, 'clicked', unsafe { glib.G_callback(print_hello) }, unsafe { nil })

	gtk.grid_attach(grid.grid(), button, 0, 0, 1, 1)

	button = gtk.button_new_with_label('Button 2')
	glib.signal_connect(button.ref, 'clicked', unsafe { glib.G_callback(print_hello) }, unsafe { nil })

	gtk.grid_attach(grid.grid(), button, 1, 0, 1, 1)

	button = gtk.button_new_with_label('Quit')
	glib.signal_connect_swapped(button.ref, 'clicked', unsafe { glib.G_callback(gtk.window_destroy) }, window.ref)

	//gtk.window_set_child(window.window(), button)
	//gtk.box_append(box.box(), button)
	gtk.grid_attach(grid.grid(), button, 0, 1, 2, 1)

	gtk.window_present(window.window())
}

/*fn command_line(app glib.Application, cmd glib.CommandLine) int {
	ret := glib.application_command_line_get_arguments(cmd)
	println(ret)
	return 0
}*/

// currently adding calls from https://docs.gtk.org/gtk4/getting_started.html
// current step #packing
fn main() {
	println('App started!')
	
	app := gtk.application_new('com.example.GtkApplication', glib.G_application_flags.flags_none)
	glib.signal_connect(app.ref, 'activate', unsafe { glib.G_callback(on_activate) }, unsafe { nil })
	//glib.signal_connect(app.ref, "command-line", unsafe { glib.G_callback(command_line) }, unsafe { nil });
	state := glib.application_run(app.application(), os.args.len, os.args)
	glib.object_unref(app.object())

	if state == 0 {
		println('Success')
	} else {
		println('Failure')
	}
	exit(state)
}
