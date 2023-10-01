shader_type canvas_item;

uniform vec4 vignette_colour: source_color;
uniform float vignette_intensity: hint_range(0.0, 1.0);

void fragment() {
	vec2 polar = UV - vec2(0.5, 0.5);
    COLOR = vignette_colour;
    COLOR.a *= length(polar) - 1.0 + vignette_intensity;
}
