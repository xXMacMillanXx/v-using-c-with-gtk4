module main

import gtk
import glib
import pixbuff
import cairo
// the three imports below are needed for includes
import pango
import harfbuzz
import graphene

import os
import net.http


fn print_hello() {
	println('Hello World!')
}

fn quit_cb(widget gtk.Widget, window gtk.Widget) {
	gtk.window_close(gtk.window(window.ref))
}

fn activate(app gtk.Application, data voidptr) {
	builder := gtk.builder_new()
	gtk.builder_add_from_file(builder, 'src/builder.ui', glib.Error { unsafe { nil } })

	window := gtk.builder_get_object(builder, 'window')
	gtk.window_set_application(gtk.window(window.ref), app)

	mut button := gtk.builder_get_object(builder, 'button1')
	glib.signal_connect(button.ref, "clicked", unsafe { glib.G_callback(print_hello) }, unsafe { nil })

	button = gtk.builder_get_object(builder, 'button2')
	glib.signal_connect(button.ref, "clicked", unsafe { glib.G_callback(print_hello) }, unsafe { nil })

	button = gtk.builder_get_object(builder, 'quit')
	glib.signal_connect_swapped(button.ref, "clicked", unsafe { glib.G_callback(quit_cb) }, window.ref)

	gtk.widget_set_visible(gtk.widget(window.ref), true)

	glib.object_unref(glib.object(builder.ref))
}

fn on_activate(app gtk.Application) {
	window := gtk.application_window_new(app)
	mut button := gtk.button_new_with_label('Button 1')
	//box := gtk.box_new(gtk.Gtk_orientation.vertical, 0)
	grid := gtk.grid_new()

	gtk.window_set_title(gtk.window(window.ref), 'My App')
	gtk.window_set_default_size(gtk.window(window.ref), 320, 240)

	//gtk.widget_set_halign(box, gtk.Gtk_align.center)
	//gtk.widget_set_valign(box, gtk.Gtk_align.center)

	//gtk.window_set_child(gtk.window(window.ref), box)

	gtk.window_set_child(gtk.window(window.ref), grid)

	glib.signal_connect(button.ref, 'clicked', unsafe { glib.G_callback(print_hello) }, unsafe { nil })

	gtk.grid_attach(gtk.grid(grid.ref), button, 0, 0, 1, 1)

	button = gtk.button_new_with_label('Button 2')
	glib.signal_connect(button.ref, 'clicked', unsafe { glib.G_callback(print_hello) }, unsafe { nil })

	gtk.grid_attach(gtk.grid(grid.ref), button, 1, 0, 1, 1)

	button = gtk.button_new_with_label('Quit')
	glib.signal_connect_swapped(button.ref, 'clicked', unsafe { glib.G_callback(gtk.window_destroy) }, window.ref)

	//gtk.window_set_child(gtk.window(window.ref), button)
	//gtk.box_append(gtk.box(box.ref), button)
	gtk.grid_attach(gtk.grid(grid.ref), button, 0, 1, 2, 1)

	gtk.window_present(gtk.window(window.ref))
}

fn on_activate_image(app gtk.Application) {
	window := gtk.application_window_new(app)
	box := gtk.box_new(gtk.Gtk_orientation.vertical, 0)
	url := 'https://fastly.picsum.photos/id/613/300/200.jpg?hmac=HBef6BibNUIRVnUP6cjqz8gfXjGiA2spUhRV_R91eqo'

	gtk.window_set_title(gtk.window(window.ref), 'My App')
	gtk.window_set_default_size(gtk.window(window.ref), 320, 240)

	gtk.widget_set_halign(box, gtk.Gtk_align.center)
	gtk.widget_set_valign(box, gtk.Gtk_align.center)

	gtk.window_set_child(gtk.window(window.ref), box)

	// get image from url
	r := http.get(url) or { panic(err) }
	image_data := r.body.bytes()
	loader := pixbuff.loader_new()
	pixbuff.loader_write_bytes(loader, image_data, glib.Error { unsafe { nil } })
	pixbuff.loader_close(loader, glib.Error { unsafe { nil } })
	pb := pixbuff.loader_get_pixbuf(loader)
	image := gtk.image_new()
	gtk.image_set_from_pixbuf(gtk.image(image.ref), pb)
	gtk.image_set_pixel_size(gtk.image(image.ref), 300)

	gtk.box_append(gtk.box(box.ref), image)

	gtk.window_present(gtk.window(window.ref))
}

fn command_line(app glib.Application, cmd glib.CommandLine) int {
	ret := glib.application_command_line_get_arguments(cmd)
	println(ret)
	return 0
}

// currently adding calls from https://docs.gtk.org/gtk4/getting_started.html
// current step #drawing in response to input
fn main() {
	println('App started!')

	app := gtk.application_new('com.example.GtkApplication', glib.G_application_flags.flags_none)
	//app := gtk.application_new('com.example.GtkApplication', glib.G_application_flags.handles_command_line)
	//glib.signal_connect(app.ref, 'activate', unsafe { glib.G_callback(on_activate) }, unsafe { nil })
	//glib.signal_connect(app.ref, "command-line", unsafe { glib.G_callback(command_line) }, unsafe { nil });
	//glib.signal_connect(app.ref, 'activate', unsafe { glib.G_callback(activate) }, unsafe { nil })
	glib.signal_connect(app.ref, 'activate', unsafe { glib.G_callback(on_activate_image) }, unsafe { nil })
	state := glib.application_run(glib.application(app.ref), os.args.len, os.args)
	glib.object_unref(glib.object(app.ref))

	if state == 0 {
		println('Success')
	} else {
		println('Failure')
	}
	exit(state)
}
