#version 120

uniform sampler2D t_Texture;
varying vec2 v_Uv;
//varying vec4 Target0;

uniform mat4 u_Transform;
uniform vec4 u_Color;

void main() {
    //Target0 = vec4(1.0, 1.0, 1.0, 1.0);
    gl_FragColor = texture2D(t_Texture, v_Uv) * u_Color;
}
