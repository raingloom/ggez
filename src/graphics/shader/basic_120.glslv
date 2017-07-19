#version 120

attribute vec2 a_Pos;
attribute vec2 a_Uv;

uniform mat4 u_Transform;
uniform vec4 u_Color;

uniform vec4 u_Src;
uniform vec2 u_Dest;
uniform vec2 u_Scale;
uniform vec2 u_Offset;
uniform vec2 u_Shear;
uniform float u_Rotation;

varying vec2 v_Uv;

void main() {
    v_Uv = a_Uv * u_Src.zw + u_Src.xy;
    mat2 rotation = mat2(cos(u_Rotation), -sin(u_Rotation), sin(u_Rotation), cos(u_Rotation));
    mat2 shear = mat2(1, u_Shear.x, u_Shear.y, 1);
    vec2 position = (((a_Pos * u_Scale) * shear) + u_Offset) * rotation + u_Dest;
    gl_TexCoord[0] = gl_MultiTexCoord0;
    gl_Position = vec4(position, 0.0, 1.0) * u_Transform;
}
