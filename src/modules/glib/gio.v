module glib

#include "gio/gio.h"

struct C.g_application {}
struct C.g_application_command_line {}
pub struct C.g_input_stream {}
pub struct C.g_cancellable {}

pub enum G_application_flags {
	flags_none = 0
	// default_flags = 0
	is_service = 1
	is_launcher = 2
	handles_open = 4
	handles_command_line = 8
	send_environment = 16
	non_unique= 32
	can_override_app_id = 64
	allow_replacement = 128
	replace = 256
}

fn C.g_application_run(&C.g_application, int, &&char) int
fn C.g_application_command_line_get_arguments(&C.g_application_command_line, int) &&char
fn C.g_memory_input_stream_new_from_data(voidptr, int, G_destroy_notify) &C.g_input_stream

pub struct Application {
	pub: ref &C.g_application
}

pub struct CommandLine {
	pub: ref &C.g_application_command_line
}

pub struct InputStream {
	pub: ref &C.g_input_stream
}

pub struct Cancellable {
	pub: ref &C.g_cancellable
}

fn convert_string_array_to_char_pointer_pointer(str_arr []string) &&char {
	pre_ret := unsafe { vcalloc(sizeof(&char) * str_arr.len) }
	for i, str in str_arr {
		chars := str.str
		unsafe {
			pre_ret[i] = chars
		}
	}
	return &pre_ret
}

pub fn application_run(app Application, argc int, argv []string) int {
	return C.g_application_run(app.ref, argc, convert_string_array_to_char_pointer_pointer(argv))
}

// argc ends up as 0, so something isn't working properly
pub fn application_command_line_get_arguments(cmd CommandLine) []string {
	argc := 0
	proxy := &argc
	argv := C.g_application_command_line_get_arguments(cmd.ref, proxy)
	println('${argv} ${argc} ${*proxy}')
	mut ret := []string {}
	for i := 0; i < argc; i++ {
		ret << unsafe { cstring_to_vstring(argv[i]) }
	}
	return ret
}

pub fn input_stream_new_from_data(data voidptr, len int, destroy G_destroy_notify) InputStream {
	return InputStream { C.g_memory_input_stream_new_from_data(data, len, destroy) }
}
