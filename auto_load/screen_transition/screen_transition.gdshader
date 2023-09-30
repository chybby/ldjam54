shader_type canvas_item;

uniform float transition_progress: hint_range(0.0, 1.0);
uniform vec4 transition_color: source_color;

void fragment() {
//    float checkerboard_zoom = 0.15;
//    // Wow.
//    if (transition_progress < 0.25) {
//        if ((mod(UV.x, checkerboard_zoom) > transition_progress * checkerboard_zoom * 2.0) == (mod(UV.y, checkerboard_zoom) > transition_progress * checkerboard_zoom * 2.0)) {
//            COLOR.a = 0.0;
//        } else {
//            COLOR = transition_color;
//        }
//    } else if (transition_progress < 0.5) {
//        if ((mod(UV.x + checkerboard_zoom / 2.0, checkerboard_zoom) > transition_progress * checkerboard_zoom * 2.0) != (mod(UV.y, checkerboard_zoom) > transition_progress * checkerboard_zoom * 2.0)) {
//            COLOR.a = 0.0;
//        } else {
//            COLOR = transition_color;
//        }
//    } else if (transition_progress < 0.75) {
//        if ((mod(UV.x, checkerboard_zoom) > (transition_progress - 0.5) * checkerboard_zoom * 2.0) != (mod(UV.y, checkerboard_zoom) > (transition_progress - 0.5) * checkerboard_zoom * 2.0)) {
//            COLOR.a = 0.0;
//        } else {
//            COLOR = transition_color;
//        }
//    } else {
//        if ((mod(UV.x + checkerboard_zoom / 2.0, checkerboard_zoom) > (transition_progress - 0.5) * checkerboard_zoom * 2.0) == (mod(UV.y, checkerboard_zoom) > (transition_progress - 0.5) * checkerboard_zoom * 2.0)) {
//            COLOR.a = 0.0;
//        } else {
//            COLOR = transition_color;
//        }
//    }

    float circle_density = 10.0;

    vec2 resolution = 1.0 / SCREEN_PIXEL_SIZE;

    vec2 uv = FRAGCOORD.xy - resolution * 0.5;
    uv /= resolution.x;

    uv = mod(uv * circle_density, 1.0) - vec2(0.5, 0.5);

    if (transition_progress < 0.5) {
        if (length(uv) + 0.5 * UV.x + 0.5 * UV.y < transition_progress * 4.0) {
            COLOR = transition_color;
        } else {
            COLOR.a = 0.0;
        }
    } else {
        if (length(uv) + 0.5 * UV.x + 0.5 * UV.y < (transition_progress - 0.5) * 4.0) {
            COLOR.a = 0.0;
        } else {
            COLOR = transition_color;
        }
    }
}
