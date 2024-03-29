#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 2) in vec2 aTexCoord;

out float Height;
out vec2 TexCoord;
out vec3 Position;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float yScale;

void main()
{
    vec3 pos = aPos;
    pos.y = pos.y * yScale;
    Height = pos.y;
    TexCoord = aTexCoord;
    Position = (view * model * vec4(pos, 1.0)).xyz;
    gl_Position = projection * view * model * vec4(pos, 1.0);
}