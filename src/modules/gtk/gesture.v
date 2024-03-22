module gtk

struct C.gtk_gesture {}
struct C.gtk_gesture_drag {}
struct C.gtk_gesture_click {}
struct C.gtk_gesture_single {}

fn C.gtk_gesture_drag_new() &C.gtk_gesture
fn C.gtk_gesture_single_set_button(&C.gtk_gesture_single, int)
fn C.gtk_gesture_click_new() &C.gtk_gesture

pub struct Gesture {
	pub: ref &C.gtk_gesture
}

pub fn (g Gesture) single() GestureSingle {
	return GestureSingle { &C.gtk_gesture_single(g.ref) }
}

pub fn (g Gesture) drag() GestureDrag {
	return GestureDrag { &C.gtk_gesture_drag(g.ref) }
}

pub fn (g Gesture) click() GestureClick {
	return GestureClick { &C.gtk_gesture_click(g.ref) }
}

pub struct GestureDrag {
	pub: ref &C.gtk_gesture_drag
}

pub struct GestureClick {
	pub: ref &C.gtk_gesture_click
}

pub struct GestureSingle {
	pub: ref &C.gtk_gesture_single
}

pub fn gesture_drag_new() Gesture {
	return Gesture { C.gtk_gesture_drag_new() }
}

pub fn gesture_single_set_button(single GestureSingle, button int) {
	C.gtk_gesture_single_set_button(single.ref, button)
}

pub fn gesture_click_new() Gesture {
	return Gesture { C.gtk_gesture_click_new() }
}
