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

fn on_activate(app gtk.Application) {
	window := gtk.application_window_new(app)
	button := gtk.button_new_with_label('Hello World!')
	glib.signal_connect_swapped(button.ref, 'clicked', unsafe { glib.G_callback(gtk.window_close) }, window.ref)
	gtk.window_set_child(window.window(), button)
	gtk.window_present(window.window())
	gtk.window_set_title(window.window(), 'My App')
}

/*fn command_line(app glib.Application, cmd glib.CommandLine) int {
	ret := glib.application_command_line_get_arguments(cmd)
	println(ret)
	return 0
}*/

fn main() {
	println('Hello World!')
	
	app := gtk.application_new('com.example.GtkApplication', glib.G_application_flags.flags_none)
	glib.signal_connect(app.ref, 'activate', unsafe { glib.G_callback(on_activate) }, unsafe { nil })
	//glib.signal_connect(app.ref, "command-line", unsafe { glib.G_callback(command_line) }, unsafe { nil });
	state := glib.application_run(app.application(), os.args.len, os.args)
	if state == 0 {
		println('Success')
	} else {
		println('Failure')
	}
}
