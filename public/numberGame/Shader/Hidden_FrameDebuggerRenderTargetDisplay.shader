//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/FrameDebuggerRenderTargetDisplay" {
Properties {
_MainTex ("", any) = "white" { }
}
SubShader {
 Tags { "ForceSupported" = "true" }
 Pass {
  Tags { "ForceSupported" = "true" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 555
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb2 = u_xlat16_4==1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb2 = u_xlat16_4==1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb2 = u_xlat16_4==1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 136
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %113 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpMemberDecorate %30 2 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %63 RelaxedPrecision 
                                             OpDecorate %66 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate %89 RelaxedPrecision 
                                             OpDecorate %91 RelaxedPrecision 
                                             OpDecorate %92 RelaxedPrecision 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %95 RelaxedPrecision 
                                             OpDecorate %98 RelaxedPrecision 
                                             OpDecorate %101 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %104 RelaxedPrecision 
                                             OpDecorate %107 RelaxedPrecision 
                                             OpDecorate %109 RelaxedPrecision 
                                             OpDecorate %110 RelaxedPrecision 
                                             OpDecorate %111 RelaxedPrecision 
                                             OpDecorate %113 RelaxedPrecision 
                                             OpDecorate %113 Location 113 
                                             OpDecorate %125 RelaxedPrecision 
                                             OpDecorate %126 RelaxedPrecision 
                                             OpDecorate %132 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 3 
                                     %21 = OpTypePointer Input %20 
               Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 2 
                      Private f32_4* %27 = OpVariable Private 
                                     %29 = OpTypeInt 32 1 
                                     %30 = OpTypeStruct %7 %7 %29 
                                     %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; i32;}* %32 = OpVariable Uniform 
                                 i32 %33 = OpConstant 1 
                                     %34 = OpTypePointer Uniform %7 
                                     %40 = OpTypePointer Private %20 
                      Private f32_3* %41 = OpVariable Private 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 0 
                                     %44 = OpTypePointer Uniform %6 
                                 u32 %48 = OpConstant 1 
                                     %52 = OpTypePointer Private %6 
                                 i32 %59 = OpConstant 0 
                                 f32 %64 = OpConstant 3.674022E-40 
                               f32_4 %65 = OpConstantComposite %64 %64 %64 %64 
                        Private f32* %68 = OpVariable Private 
                                     %72 = OpTypeBool 
                                     %73 = OpTypePointer Private %72 
                       Private bool* %74 = OpVariable Private 
                                     %78 = OpTypePointer Function %7 
                                 f32 %90 = OpConstant 3.674022E-40 
                      Private f32_3* %94 = OpVariable Private 
                                 f32 %96 = OpConstant 3.674022E-40 
                               f32_3 %97 = OpConstantComposite %96 %96 %96 
                                 f32 %99 = OpConstant 3.674022E-40 
                              f32_3 %100 = OpConstantComposite %99 %99 %99 
                                f32 %105 = OpConstant 3.674022E-40 
                              f32_3 %106 = OpConstantComposite %105 %105 %105 
                     Private f32_3* %108 = OpVariable Private 
                                    %112 = OpTypePointer Output %7 
                      Output f32_4* %113 = OpVariable Output 
                                i32 %114 = OpConstant 2 
                                    %115 = OpTypePointer Uniform %29 
                                    %119 = OpTypePointer Function %20 
                                u32 %130 = OpConstant 3 
                                    %133 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                     Function f32_4* %79 = OpVariable Function 
                    Function f32_3* %120 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_3 %24 = OpLoad vs_TEXCOORD0 
                               f32_2 %25 = OpVectorShuffle %24 %24 0 1 
                               f32_4 %26 = OpImageSampleImplicitLod %19 %25 
                                             OpStore %9 %26 
                               f32_4 %28 = OpLoad %9 
                      Uniform f32_4* %35 = OpAccessChain %32 %33 
                               f32_4 %36 = OpLoad %35 
                               f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                               f32_4 %38 = OpFNegate %37 
                               f32_4 %39 = OpFAdd %28 %38 
                                             OpStore %27 %39 
                        Uniform f32* %45 = OpAccessChain %32 %33 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                        Uniform f32* %49 = OpAccessChain %32 %33 %48 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpFAdd %47 %50 
                        Private f32* %53 = OpAccessChain %41 %43 
                                             OpStore %53 %51 
                               f32_4 %54 = OpLoad %27 
                               f32_3 %55 = OpLoad %41 
                               f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                               f32_4 %57 = OpFDiv %54 %56 
                                             OpStore %27 %57 
                               f32_4 %58 = OpLoad %27 
                      Uniform f32_4* %60 = OpAccessChain %32 %59 
                               f32_4 %61 = OpLoad %60 
                               f32_4 %62 = OpFMul %58 %61 
                                             OpStore %27 %62 
                               f32_4 %63 = OpLoad %27 
                                 f32 %66 = OpDot %63 %65 
                        Private f32* %67 = OpAccessChain %41 %43 
                                             OpStore %67 %66 
                      Uniform f32_4* %69 = OpAccessChain %32 %59 
                               f32_4 %70 = OpLoad %69 
                                 f32 %71 = OpDot %70 %65 
                                             OpStore %68 %71 
                                 f32 %75 = OpLoad %68 
                                bool %76 = OpFOrdEqual %75 %64 
                                             OpStore %74 %76 
                                bool %77 = OpLoad %74 
                                             OpSelectionMerge %81 None 
                                             OpBranchConditional %77 %80 %84 
                                     %80 = OpLabel 
                               f32_3 %82 = OpLoad %41 
                               f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                             OpStore %79 %83 
                                             OpBranch %81 
                                     %84 = OpLabel 
                               f32_4 %85 = OpLoad %27 
                                             OpStore %79 %85 
                                             OpBranch %81 
                                     %81 = OpLabel 
                               f32_4 %86 = OpLoad %79 
                                             OpStore %27 %86 
                               f32_4 %87 = OpLoad %27 
                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                             OpStore %41 %88 
                               f32_3 %89 = OpLoad %41 
                               f32_3 %91 = OpCompositeConstruct %90 %90 %90 
                               f32_3 %92 = OpCompositeConstruct %64 %64 %64 
                               f32_3 %93 = OpExtInst %1 43 %89 %91 %92 
                                             OpStore %41 %93 
                               f32_3 %95 = OpLoad %41 
                               f32_3 %98 = OpFMul %95 %97 
                              f32_3 %101 = OpFAdd %98 %100 
                                             OpStore %94 %101 
                              f32_3 %102 = OpLoad %41 
                              f32_3 %103 = OpLoad %94 
                              f32_3 %104 = OpFMul %102 %103 
                              f32_3 %107 = OpFAdd %104 %106 
                                             OpStore %94 %107 
                              f32_3 %109 = OpLoad %41 
                              f32_3 %110 = OpLoad %94 
                              f32_3 %111 = OpFMul %109 %110 
                                             OpStore %108 %111 
                       Uniform i32* %116 = OpAccessChain %32 %114 
                                i32 %117 = OpLoad %116 
                               bool %118 = OpINotEqual %117 %59 
                                             OpSelectionMerge %122 None 
                                             OpBranchConditional %118 %121 %124 
                                    %121 = OpLabel 
                              f32_3 %123 = OpLoad %108 
                                             OpStore %120 %123 
                                             OpBranch %122 
                                    %124 = OpLabel 
                              f32_4 %125 = OpLoad %27 
                              f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                             OpStore %120 %126 
                                             OpBranch %122 
                                    %122 = OpLabel 
                              f32_3 %127 = OpLoad %120 
                              f32_4 %128 = OpLoad %113 
                              f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                             OpStore %113 %129 
                       Private f32* %131 = OpAccessChain %27 %130 
                                f32 %132 = OpLoad %131 
                        Output f32* %134 = OpAccessChain %113 %130 
                                             OpStore %134 %132 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 136
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %113 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpMemberDecorate %30 2 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %63 RelaxedPrecision 
                                             OpDecorate %66 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate %89 RelaxedPrecision 
                                             OpDecorate %91 RelaxedPrecision 
                                             OpDecorate %92 RelaxedPrecision 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %95 RelaxedPrecision 
                                             OpDecorate %98 RelaxedPrecision 
                                             OpDecorate %101 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %104 RelaxedPrecision 
                                             OpDecorate %107 RelaxedPrecision 
                                             OpDecorate %109 RelaxedPrecision 
                                             OpDecorate %110 RelaxedPrecision 
                                             OpDecorate %111 RelaxedPrecision 
                                             OpDecorate %113 RelaxedPrecision 
                                             OpDecorate %113 Location 113 
                                             OpDecorate %125 RelaxedPrecision 
                                             OpDecorate %126 RelaxedPrecision 
                                             OpDecorate %132 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 3 
                                     %21 = OpTypePointer Input %20 
               Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 2 
                      Private f32_4* %27 = OpVariable Private 
                                     %29 = OpTypeInt 32 1 
                                     %30 = OpTypeStruct %7 %7 %29 
                                     %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; i32;}* %32 = OpVariable Uniform 
                                 i32 %33 = OpConstant 1 
                                     %34 = OpTypePointer Uniform %7 
                                     %40 = OpTypePointer Private %20 
                      Private f32_3* %41 = OpVariable Private 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 0 
                                     %44 = OpTypePointer Uniform %6 
                                 u32 %48 = OpConstant 1 
                                     %52 = OpTypePointer Private %6 
                                 i32 %59 = OpConstant 0 
                                 f32 %64 = OpConstant 3.674022E-40 
                               f32_4 %65 = OpConstantComposite %64 %64 %64 %64 
                        Private f32* %68 = OpVariable Private 
                                     %72 = OpTypeBool 
                                     %73 = OpTypePointer Private %72 
                       Private bool* %74 = OpVariable Private 
                                     %78 = OpTypePointer Function %7 
                                 f32 %90 = OpConstant 3.674022E-40 
                      Private f32_3* %94 = OpVariable Private 
                                 f32 %96 = OpConstant 3.674022E-40 
                               f32_3 %97 = OpConstantComposite %96 %96 %96 
                                 f32 %99 = OpConstant 3.674022E-40 
                              f32_3 %100 = OpConstantComposite %99 %99 %99 
                                f32 %105 = OpConstant 3.674022E-40 
                              f32_3 %106 = OpConstantComposite %105 %105 %105 
                     Private f32_3* %108 = OpVariable Private 
                                    %112 = OpTypePointer Output %7 
                      Output f32_4* %113 = OpVariable Output 
                                i32 %114 = OpConstant 2 
                                    %115 = OpTypePointer Uniform %29 
                                    %119 = OpTypePointer Function %20 
                                u32 %130 = OpConstant 3 
                                    %133 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                     Function f32_4* %79 = OpVariable Function 
                    Function f32_3* %120 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_3 %24 = OpLoad vs_TEXCOORD0 
                               f32_2 %25 = OpVectorShuffle %24 %24 0 1 
                               f32_4 %26 = OpImageSampleImplicitLod %19 %25 
                                             OpStore %9 %26 
                               f32_4 %28 = OpLoad %9 
                      Uniform f32_4* %35 = OpAccessChain %32 %33 
                               f32_4 %36 = OpLoad %35 
                               f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                               f32_4 %38 = OpFNegate %37 
                               f32_4 %39 = OpFAdd %28 %38 
                                             OpStore %27 %39 
                        Uniform f32* %45 = OpAccessChain %32 %33 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                        Uniform f32* %49 = OpAccessChain %32 %33 %48 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpFAdd %47 %50 
                        Private f32* %53 = OpAccessChain %41 %43 
                                             OpStore %53 %51 
                               f32_4 %54 = OpLoad %27 
                               f32_3 %55 = OpLoad %41 
                               f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                               f32_4 %57 = OpFDiv %54 %56 
                                             OpStore %27 %57 
                               f32_4 %58 = OpLoad %27 
                      Uniform f32_4* %60 = OpAccessChain %32 %59 
                               f32_4 %61 = OpLoad %60 
                               f32_4 %62 = OpFMul %58 %61 
                                             OpStore %27 %62 
                               f32_4 %63 = OpLoad %27 
                                 f32 %66 = OpDot %63 %65 
                        Private f32* %67 = OpAccessChain %41 %43 
                                             OpStore %67 %66 
                      Uniform f32_4* %69 = OpAccessChain %32 %59 
                               f32_4 %70 = OpLoad %69 
                                 f32 %71 = OpDot %70 %65 
                                             OpStore %68 %71 
                                 f32 %75 = OpLoad %68 
                                bool %76 = OpFOrdEqual %75 %64 
                                             OpStore %74 %76 
                                bool %77 = OpLoad %74 
                                             OpSelectionMerge %81 None 
                                             OpBranchConditional %77 %80 %84 
                                     %80 = OpLabel 
                               f32_3 %82 = OpLoad %41 
                               f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                             OpStore %79 %83 
                                             OpBranch %81 
                                     %84 = OpLabel 
                               f32_4 %85 = OpLoad %27 
                                             OpStore %79 %85 
                                             OpBranch %81 
                                     %81 = OpLabel 
                               f32_4 %86 = OpLoad %79 
                                             OpStore %27 %86 
                               f32_4 %87 = OpLoad %27 
                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                             OpStore %41 %88 
                               f32_3 %89 = OpLoad %41 
                               f32_3 %91 = OpCompositeConstruct %90 %90 %90 
                               f32_3 %92 = OpCompositeConstruct %64 %64 %64 
                               f32_3 %93 = OpExtInst %1 43 %89 %91 %92 
                                             OpStore %41 %93 
                               f32_3 %95 = OpLoad %41 
                               f32_3 %98 = OpFMul %95 %97 
                              f32_3 %101 = OpFAdd %98 %100 
                                             OpStore %94 %101 
                              f32_3 %102 = OpLoad %41 
                              f32_3 %103 = OpLoad %94 
                              f32_3 %104 = OpFMul %102 %103 
                              f32_3 %107 = OpFAdd %104 %106 
                                             OpStore %94 %107 
                              f32_3 %109 = OpLoad %41 
                              f32_3 %110 = OpLoad %94 
                              f32_3 %111 = OpFMul %109 %110 
                                             OpStore %108 %111 
                       Uniform i32* %116 = OpAccessChain %32 %114 
                                i32 %117 = OpLoad %116 
                               bool %118 = OpINotEqual %117 %59 
                                             OpSelectionMerge %122 None 
                                             OpBranchConditional %118 %121 %124 
                                    %121 = OpLabel 
                              f32_3 %123 = OpLoad %108 
                                             OpStore %120 %123 
                                             OpBranch %122 
                                    %124 = OpLabel 
                              f32_4 %125 = OpLoad %27 
                              f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                             OpStore %120 %126 
                                             OpBranch %122 
                                    %122 = OpLabel 
                              f32_3 %127 = OpLoad %120 
                              f32_4 %128 = OpLoad %113 
                              f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                             OpStore %113 %129 
                       Private f32* %131 = OpAccessChain %27 %130 
                                f32 %132 = OpLoad %131 
                        Output f32* %134 = OpAccessChain %113 %130 
                                             OpStore %134 %132 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 136
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %113 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpMemberDecorate %30 2 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %63 RelaxedPrecision 
                                             OpDecorate %66 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate %89 RelaxedPrecision 
                                             OpDecorate %91 RelaxedPrecision 
                                             OpDecorate %92 RelaxedPrecision 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %95 RelaxedPrecision 
                                             OpDecorate %98 RelaxedPrecision 
                                             OpDecorate %101 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %104 RelaxedPrecision 
                                             OpDecorate %107 RelaxedPrecision 
                                             OpDecorate %109 RelaxedPrecision 
                                             OpDecorate %110 RelaxedPrecision 
                                             OpDecorate %111 RelaxedPrecision 
                                             OpDecorate %113 RelaxedPrecision 
                                             OpDecorate %113 Location 113 
                                             OpDecorate %125 RelaxedPrecision 
                                             OpDecorate %126 RelaxedPrecision 
                                             OpDecorate %132 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 3 
                                     %21 = OpTypePointer Input %20 
               Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 2 
                      Private f32_4* %27 = OpVariable Private 
                                     %29 = OpTypeInt 32 1 
                                     %30 = OpTypeStruct %7 %7 %29 
                                     %31 = OpTypePointer Uniform %30 
Uniform struct {f32_4; f32_4; i32;}* %32 = OpVariable Uniform 
                                 i32 %33 = OpConstant 1 
                                     %34 = OpTypePointer Uniform %7 
                                     %40 = OpTypePointer Private %20 
                      Private f32_3* %41 = OpVariable Private 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 0 
                                     %44 = OpTypePointer Uniform %6 
                                 u32 %48 = OpConstant 1 
                                     %52 = OpTypePointer Private %6 
                                 i32 %59 = OpConstant 0 
                                 f32 %64 = OpConstant 3.674022E-40 
                               f32_4 %65 = OpConstantComposite %64 %64 %64 %64 
                        Private f32* %68 = OpVariable Private 
                                     %72 = OpTypeBool 
                                     %73 = OpTypePointer Private %72 
                       Private bool* %74 = OpVariable Private 
                                     %78 = OpTypePointer Function %7 
                                 f32 %90 = OpConstant 3.674022E-40 
                      Private f32_3* %94 = OpVariable Private 
                                 f32 %96 = OpConstant 3.674022E-40 
                               f32_3 %97 = OpConstantComposite %96 %96 %96 
                                 f32 %99 = OpConstant 3.674022E-40 
                              f32_3 %100 = OpConstantComposite %99 %99 %99 
                                f32 %105 = OpConstant 3.674022E-40 
                              f32_3 %106 = OpConstantComposite %105 %105 %105 
                     Private f32_3* %108 = OpVariable Private 
                                    %112 = OpTypePointer Output %7 
                      Output f32_4* %113 = OpVariable Output 
                                i32 %114 = OpConstant 2 
                                    %115 = OpTypePointer Uniform %29 
                                    %119 = OpTypePointer Function %20 
                                u32 %130 = OpConstant 3 
                                    %133 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                     Function f32_4* %79 = OpVariable Function 
                    Function f32_3* %120 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_3 %24 = OpLoad vs_TEXCOORD0 
                               f32_2 %25 = OpVectorShuffle %24 %24 0 1 
                               f32_4 %26 = OpImageSampleImplicitLod %19 %25 
                                             OpStore %9 %26 
                               f32_4 %28 = OpLoad %9 
                      Uniform f32_4* %35 = OpAccessChain %32 %33 
                               f32_4 %36 = OpLoad %35 
                               f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                               f32_4 %38 = OpFNegate %37 
                               f32_4 %39 = OpFAdd %28 %38 
                                             OpStore %27 %39 
                        Uniform f32* %45 = OpAccessChain %32 %33 %43 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFNegate %46 
                        Uniform f32* %49 = OpAccessChain %32 %33 %48 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpFAdd %47 %50 
                        Private f32* %53 = OpAccessChain %41 %43 
                                             OpStore %53 %51 
                               f32_4 %54 = OpLoad %27 
                               f32_3 %55 = OpLoad %41 
                               f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                               f32_4 %57 = OpFDiv %54 %56 
                                             OpStore %27 %57 
                               f32_4 %58 = OpLoad %27 
                      Uniform f32_4* %60 = OpAccessChain %32 %59 
                               f32_4 %61 = OpLoad %60 
                               f32_4 %62 = OpFMul %58 %61 
                                             OpStore %27 %62 
                               f32_4 %63 = OpLoad %27 
                                 f32 %66 = OpDot %63 %65 
                        Private f32* %67 = OpAccessChain %41 %43 
                                             OpStore %67 %66 
                      Uniform f32_4* %69 = OpAccessChain %32 %59 
                               f32_4 %70 = OpLoad %69 
                                 f32 %71 = OpDot %70 %65 
                                             OpStore %68 %71 
                                 f32 %75 = OpLoad %68 
                                bool %76 = OpFOrdEqual %75 %64 
                                             OpStore %74 %76 
                                bool %77 = OpLoad %74 
                                             OpSelectionMerge %81 None 
                                             OpBranchConditional %77 %80 %84 
                                     %80 = OpLabel 
                               f32_3 %82 = OpLoad %41 
                               f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                             OpStore %79 %83 
                                             OpBranch %81 
                                     %84 = OpLabel 
                               f32_4 %85 = OpLoad %27 
                                             OpStore %79 %85 
                                             OpBranch %81 
                                     %81 = OpLabel 
                               f32_4 %86 = OpLoad %79 
                                             OpStore %27 %86 
                               f32_4 %87 = OpLoad %27 
                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                             OpStore %41 %88 
                               f32_3 %89 = OpLoad %41 
                               f32_3 %91 = OpCompositeConstruct %90 %90 %90 
                               f32_3 %92 = OpCompositeConstruct %64 %64 %64 
                               f32_3 %93 = OpExtInst %1 43 %89 %91 %92 
                                             OpStore %41 %93 
                               f32_3 %95 = OpLoad %41 
                               f32_3 %98 = OpFMul %95 %97 
                              f32_3 %101 = OpFAdd %98 %100 
                                             OpStore %94 %101 
                              f32_3 %102 = OpLoad %41 
                              f32_3 %103 = OpLoad %94 
                              f32_3 %104 = OpFMul %102 %103 
                              f32_3 %107 = OpFAdd %104 %106 
                                             OpStore %94 %107 
                              f32_3 %109 = OpLoad %41 
                              f32_3 %110 = OpLoad %94 
                              f32_3 %111 = OpFMul %109 %110 
                                             OpStore %108 %111 
                       Uniform i32* %116 = OpAccessChain %32 %114 
                                i32 %117 = OpLoad %116 
                               bool %118 = OpINotEqual %117 %59 
                                             OpSelectionMerge %122 None 
                                             OpBranchConditional %118 %121 %124 
                                    %121 = OpLabel 
                              f32_3 %123 = OpLoad %108 
                                             OpStore %120 %123 
                                             OpBranch %122 
                                    %124 = OpLabel 
                              f32_4 %125 = OpLoad %27 
                              f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                             OpStore %120 %126 
                                             OpBranch %122 
                                    %122 = OpLabel 
                              f32_3 %127 = OpLoad %120 
                              f32_4 %128 = OpLoad %113 
                              f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                             OpStore %113 %129 
                       Private f32* %131 = OpAccessChain %27 %130 
                                f32 %132 = OpLoad %131 
                        Output f32* %134 = OpAccessChain %113 %130 
                                             OpStore %134 %132 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
}
}
 Pass {
  Tags { "ForceSupported" = "true" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 97613
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp samplerCube _MainTex;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = textureCube(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb2 = u_xlat16_4==1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp samplerCube _MainTex;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = textureCube(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb2 = u_xlat16_4==1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp samplerCube _MainTex;
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = textureCube(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlatb2 = u_xlat16_4==1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp samplerCube _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp samplerCube _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform highp samplerCube _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 134
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %22 %111 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate %12 DescriptorSet 12 
                                               OpDecorate %12 Binding 12 
                                               OpDecorate %16 DescriptorSet 16 
                                               OpDecorate %16 Binding 16 
                                               OpDecorate vs_TEXCOORD0 Location 22 
                                               OpDecorate %25 RelaxedPrecision 
                                               OpMemberDecorate %28 0 RelaxedPrecision 
                                               OpMemberDecorate %28 0 Offset 28 
                                               OpMemberDecorate %28 1 RelaxedPrecision 
                                               OpMemberDecorate %28 1 Offset 28 
                                               OpMemberDecorate %28 2 Offset 28 
                                               OpDecorate %28 Block 
                                               OpDecorate %30 DescriptorSet 30 
                                               OpDecorate %30 Binding 30 
                                               OpDecorate %34 RelaxedPrecision 
                                               OpDecorate %35 RelaxedPrecision 
                                               OpDecorate %36 RelaxedPrecision 
                                               OpDecorate %39 RelaxedPrecision 
                                               OpDecorate %44 RelaxedPrecision 
                                               OpDecorate %45 RelaxedPrecision 
                                               OpDecorate %48 RelaxedPrecision 
                                               OpDecorate %49 RelaxedPrecision 
                                               OpDecorate %52 RelaxedPrecision 
                                               OpDecorate %53 RelaxedPrecision 
                                               OpDecorate %54 RelaxedPrecision 
                                               OpDecorate %55 RelaxedPrecision 
                                               OpDecorate %56 RelaxedPrecision 
                                               OpDecorate %59 RelaxedPrecision 
                                               OpDecorate %60 RelaxedPrecision 
                                               OpDecorate %61 RelaxedPrecision 
                                               OpDecorate %64 RelaxedPrecision 
                                               OpDecorate %66 RelaxedPrecision 
                                               OpDecorate %68 RelaxedPrecision 
                                               OpDecorate %69 RelaxedPrecision 
                                               OpDecorate %73 RelaxedPrecision 
                                               OpDecorate %80 RelaxedPrecision 
                                               OpDecorate %81 RelaxedPrecision 
                                               OpDecorate %83 RelaxedPrecision 
                                               OpDecorate %84 RelaxedPrecision 
                                               OpDecorate %85 RelaxedPrecision 
                                               OpDecorate %86 RelaxedPrecision 
                                               OpDecorate %87 RelaxedPrecision 
                                               OpDecorate %89 RelaxedPrecision 
                                               OpDecorate %90 RelaxedPrecision 
                                               OpDecorate %91 RelaxedPrecision 
                                               OpDecorate %92 RelaxedPrecision 
                                               OpDecorate %93 RelaxedPrecision 
                                               OpDecorate %96 RelaxedPrecision 
                                               OpDecorate %99 RelaxedPrecision 
                                               OpDecorate %100 RelaxedPrecision 
                                               OpDecorate %101 RelaxedPrecision 
                                               OpDecorate %102 RelaxedPrecision 
                                               OpDecorate %105 RelaxedPrecision 
                                               OpDecorate %107 RelaxedPrecision 
                                               OpDecorate %108 RelaxedPrecision 
                                               OpDecorate %109 RelaxedPrecision 
                                               OpDecorate %111 RelaxedPrecision 
                                               OpDecorate %111 Location 111 
                                               OpDecorate %123 RelaxedPrecision 
                                               OpDecorate %124 RelaxedPrecision 
                                               OpDecorate %130 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypeVector %6 3 
                                       %21 = OpTypePointer Input %20 
                 Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                        Private f32_4* %25 = OpVariable Private 
                                       %27 = OpTypeInt 32 1 
                                       %28 = OpTypeStruct %7 %7 %27 
                                       %29 = OpTypePointer Uniform %28 
  Uniform struct {f32_4; f32_4; i32;}* %30 = OpVariable Uniform 
                                   i32 %31 = OpConstant 1 
                                       %32 = OpTypePointer Uniform %7 
                                       %38 = OpTypePointer Private %20 
                        Private f32_3* %39 = OpVariable Private 
                                       %40 = OpTypeInt 32 0 
                                   u32 %41 = OpConstant 0 
                                       %42 = OpTypePointer Uniform %6 
                                   u32 %46 = OpConstant 1 
                                       %50 = OpTypePointer Private %6 
                                   i32 %57 = OpConstant 0 
                                   f32 %62 = OpConstant 3.674022E-40 
                                 f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                          Private f32* %66 = OpVariable Private 
                                       %70 = OpTypeBool 
                                       %71 = OpTypePointer Private %70 
                         Private bool* %72 = OpVariable Private 
                                       %76 = OpTypePointer Function %7 
                                   f32 %88 = OpConstant 3.674022E-40 
                        Private f32_3* %92 = OpVariable Private 
                                   f32 %94 = OpConstant 3.674022E-40 
                                 f32_3 %95 = OpConstantComposite %94 %94 %94 
                                   f32 %97 = OpConstant 3.674022E-40 
                                 f32_3 %98 = OpConstantComposite %97 %97 %97 
                                  f32 %103 = OpConstant 3.674022E-40 
                                f32_3 %104 = OpConstantComposite %103 %103 %103 
                       Private f32_3* %106 = OpVariable Private 
                                      %110 = OpTypePointer Output %7 
                        Output f32_4* %111 = OpVariable Output 
                                  i32 %112 = OpConstant 2 
                                      %113 = OpTypePointer Uniform %27 
                                      %117 = OpTypePointer Function %20 
                                  u32 %128 = OpConstant 3 
                                      %131 = OpTypePointer Output %6 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                       Function f32_4* %77 = OpVariable Function 
                      Function f32_3* %118 = OpVariable Function 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_3 %23 = OpLoad vs_TEXCOORD0 
                                 f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                               OpStore %9 %24 
                                 f32_4 %26 = OpLoad %9 
                        Uniform f32_4* %33 = OpAccessChain %30 %31 
                                 f32_4 %34 = OpLoad %33 
                                 f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                 f32_4 %36 = OpFNegate %35 
                                 f32_4 %37 = OpFAdd %26 %36 
                                               OpStore %25 %37 
                          Uniform f32* %43 = OpAccessChain %30 %31 %41 
                                   f32 %44 = OpLoad %43 
                                   f32 %45 = OpFNegate %44 
                          Uniform f32* %47 = OpAccessChain %30 %31 %46 
                                   f32 %48 = OpLoad %47 
                                   f32 %49 = OpFAdd %45 %48 
                          Private f32* %51 = OpAccessChain %39 %41 
                                               OpStore %51 %49 
                                 f32_4 %52 = OpLoad %25 
                                 f32_3 %53 = OpLoad %39 
                                 f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                                 f32_4 %55 = OpFDiv %52 %54 
                                               OpStore %25 %55 
                                 f32_4 %56 = OpLoad %25 
                        Uniform f32_4* %58 = OpAccessChain %30 %57 
                                 f32_4 %59 = OpLoad %58 
                                 f32_4 %60 = OpFMul %56 %59 
                                               OpStore %25 %60 
                                 f32_4 %61 = OpLoad %25 
                                   f32 %64 = OpDot %61 %63 
                          Private f32* %65 = OpAccessChain %39 %41 
                                               OpStore %65 %64 
                        Uniform f32_4* %67 = OpAccessChain %30 %57 
                                 f32_4 %68 = OpLoad %67 
                                   f32 %69 = OpDot %68 %63 
                                               OpStore %66 %69 
                                   f32 %73 = OpLoad %66 
                                  bool %74 = OpFOrdEqual %73 %62 
                                               OpStore %72 %74 
                                  bool %75 = OpLoad %72 
                                               OpSelectionMerge %79 None 
                                               OpBranchConditional %75 %78 %82 
                                       %78 = OpLabel 
                                 f32_3 %80 = OpLoad %39 
                                 f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                               OpStore %77 %81 
                                               OpBranch %79 
                                       %82 = OpLabel 
                                 f32_4 %83 = OpLoad %25 
                                               OpStore %77 %83 
                                               OpBranch %79 
                                       %79 = OpLabel 
                                 f32_4 %84 = OpLoad %77 
                                               OpStore %25 %84 
                                 f32_4 %85 = OpLoad %25 
                                 f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                               OpStore %39 %86 
                                 f32_3 %87 = OpLoad %39 
                                 f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                 f32_3 %90 = OpCompositeConstruct %62 %62 %62 
                                 f32_3 %91 = OpExtInst %1 43 %87 %89 %90 
                                               OpStore %39 %91 
                                 f32_3 %93 = OpLoad %39 
                                 f32_3 %96 = OpFMul %93 %95 
                                 f32_3 %99 = OpFAdd %96 %98 
                                               OpStore %92 %99 
                                f32_3 %100 = OpLoad %39 
                                f32_3 %101 = OpLoad %92 
                                f32_3 %102 = OpFMul %100 %101 
                                f32_3 %105 = OpFAdd %102 %104 
                                               OpStore %92 %105 
                                f32_3 %107 = OpLoad %39 
                                f32_3 %108 = OpLoad %92 
                                f32_3 %109 = OpFMul %107 %108 
                                               OpStore %106 %109 
                         Uniform i32* %114 = OpAccessChain %30 %112 
                                  i32 %115 = OpLoad %114 
                                 bool %116 = OpINotEqual %115 %57 
                                               OpSelectionMerge %120 None 
                                               OpBranchConditional %116 %119 %122 
                                      %119 = OpLabel 
                                f32_3 %121 = OpLoad %106 
                                               OpStore %118 %121 
                                               OpBranch %120 
                                      %122 = OpLabel 
                                f32_4 %123 = OpLoad %25 
                                f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                               OpStore %118 %124 
                                               OpBranch %120 
                                      %120 = OpLabel 
                                f32_3 %125 = OpLoad %118 
                                f32_4 %126 = OpLoad %111 
                                f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                               OpStore %111 %127 
                         Private f32* %129 = OpAccessChain %25 %128 
                                  f32 %130 = OpLoad %129 
                          Output f32* %132 = OpAccessChain %111 %128 
                                               OpStore %132 %130 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 134
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %22 %111 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate %12 DescriptorSet 12 
                                               OpDecorate %12 Binding 12 
                                               OpDecorate %16 DescriptorSet 16 
                                               OpDecorate %16 Binding 16 
                                               OpDecorate vs_TEXCOORD0 Location 22 
                                               OpDecorate %25 RelaxedPrecision 
                                               OpMemberDecorate %28 0 RelaxedPrecision 
                                               OpMemberDecorate %28 0 Offset 28 
                                               OpMemberDecorate %28 1 RelaxedPrecision 
                                               OpMemberDecorate %28 1 Offset 28 
                                               OpMemberDecorate %28 2 Offset 28 
                                               OpDecorate %28 Block 
                                               OpDecorate %30 DescriptorSet 30 
                                               OpDecorate %30 Binding 30 
                                               OpDecorate %34 RelaxedPrecision 
                                               OpDecorate %35 RelaxedPrecision 
                                               OpDecorate %36 RelaxedPrecision 
                                               OpDecorate %39 RelaxedPrecision 
                                               OpDecorate %44 RelaxedPrecision 
                                               OpDecorate %45 RelaxedPrecision 
                                               OpDecorate %48 RelaxedPrecision 
                                               OpDecorate %49 RelaxedPrecision 
                                               OpDecorate %52 RelaxedPrecision 
                                               OpDecorate %53 RelaxedPrecision 
                                               OpDecorate %54 RelaxedPrecision 
                                               OpDecorate %55 RelaxedPrecision 
                                               OpDecorate %56 RelaxedPrecision 
                                               OpDecorate %59 RelaxedPrecision 
                                               OpDecorate %60 RelaxedPrecision 
                                               OpDecorate %61 RelaxedPrecision 
                                               OpDecorate %64 RelaxedPrecision 
                                               OpDecorate %66 RelaxedPrecision 
                                               OpDecorate %68 RelaxedPrecision 
                                               OpDecorate %69 RelaxedPrecision 
                                               OpDecorate %73 RelaxedPrecision 
                                               OpDecorate %80 RelaxedPrecision 
                                               OpDecorate %81 RelaxedPrecision 
                                               OpDecorate %83 RelaxedPrecision 
                                               OpDecorate %84 RelaxedPrecision 
                                               OpDecorate %85 RelaxedPrecision 
                                               OpDecorate %86 RelaxedPrecision 
                                               OpDecorate %87 RelaxedPrecision 
                                               OpDecorate %89 RelaxedPrecision 
                                               OpDecorate %90 RelaxedPrecision 
                                               OpDecorate %91 RelaxedPrecision 
                                               OpDecorate %92 RelaxedPrecision 
                                               OpDecorate %93 RelaxedPrecision 
                                               OpDecorate %96 RelaxedPrecision 
                                               OpDecorate %99 RelaxedPrecision 
                                               OpDecorate %100 RelaxedPrecision 
                                               OpDecorate %101 RelaxedPrecision 
                                               OpDecorate %102 RelaxedPrecision 
                                               OpDecorate %105 RelaxedPrecision 
                                               OpDecorate %107 RelaxedPrecision 
                                               OpDecorate %108 RelaxedPrecision 
                                               OpDecorate %109 RelaxedPrecision 
                                               OpDecorate %111 RelaxedPrecision 
                                               OpDecorate %111 Location 111 
                                               OpDecorate %123 RelaxedPrecision 
                                               OpDecorate %124 RelaxedPrecision 
                                               OpDecorate %130 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypeVector %6 3 
                                       %21 = OpTypePointer Input %20 
                 Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                        Private f32_4* %25 = OpVariable Private 
                                       %27 = OpTypeInt 32 1 
                                       %28 = OpTypeStruct %7 %7 %27 
                                       %29 = OpTypePointer Uniform %28 
  Uniform struct {f32_4; f32_4; i32;}* %30 = OpVariable Uniform 
                                   i32 %31 = OpConstant 1 
                                       %32 = OpTypePointer Uniform %7 
                                       %38 = OpTypePointer Private %20 
                        Private f32_3* %39 = OpVariable Private 
                                       %40 = OpTypeInt 32 0 
                                   u32 %41 = OpConstant 0 
                                       %42 = OpTypePointer Uniform %6 
                                   u32 %46 = OpConstant 1 
                                       %50 = OpTypePointer Private %6 
                                   i32 %57 = OpConstant 0 
                                   f32 %62 = OpConstant 3.674022E-40 
                                 f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                          Private f32* %66 = OpVariable Private 
                                       %70 = OpTypeBool 
                                       %71 = OpTypePointer Private %70 
                         Private bool* %72 = OpVariable Private 
                                       %76 = OpTypePointer Function %7 
                                   f32 %88 = OpConstant 3.674022E-40 
                        Private f32_3* %92 = OpVariable Private 
                                   f32 %94 = OpConstant 3.674022E-40 
                                 f32_3 %95 = OpConstantComposite %94 %94 %94 
                                   f32 %97 = OpConstant 3.674022E-40 
                                 f32_3 %98 = OpConstantComposite %97 %97 %97 
                                  f32 %103 = OpConstant 3.674022E-40 
                                f32_3 %104 = OpConstantComposite %103 %103 %103 
                       Private f32_3* %106 = OpVariable Private 
                                      %110 = OpTypePointer Output %7 
                        Output f32_4* %111 = OpVariable Output 
                                  i32 %112 = OpConstant 2 
                                      %113 = OpTypePointer Uniform %27 
                                      %117 = OpTypePointer Function %20 
                                  u32 %128 = OpConstant 3 
                                      %131 = OpTypePointer Output %6 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                       Function f32_4* %77 = OpVariable Function 
                      Function f32_3* %118 = OpVariable Function 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_3 %23 = OpLoad vs_TEXCOORD0 
                                 f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                               OpStore %9 %24 
                                 f32_4 %26 = OpLoad %9 
                        Uniform f32_4* %33 = OpAccessChain %30 %31 
                                 f32_4 %34 = OpLoad %33 
                                 f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                 f32_4 %36 = OpFNegate %35 
                                 f32_4 %37 = OpFAdd %26 %36 
                                               OpStore %25 %37 
                          Uniform f32* %43 = OpAccessChain %30 %31 %41 
                                   f32 %44 = OpLoad %43 
                                   f32 %45 = OpFNegate %44 
                          Uniform f32* %47 = OpAccessChain %30 %31 %46 
                                   f32 %48 = OpLoad %47 
                                   f32 %49 = OpFAdd %45 %48 
                          Private f32* %51 = OpAccessChain %39 %41 
                                               OpStore %51 %49 
                                 f32_4 %52 = OpLoad %25 
                                 f32_3 %53 = OpLoad %39 
                                 f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                                 f32_4 %55 = OpFDiv %52 %54 
                                               OpStore %25 %55 
                                 f32_4 %56 = OpLoad %25 
                        Uniform f32_4* %58 = OpAccessChain %30 %57 
                                 f32_4 %59 = OpLoad %58 
                                 f32_4 %60 = OpFMul %56 %59 
                                               OpStore %25 %60 
                                 f32_4 %61 = OpLoad %25 
                                   f32 %64 = OpDot %61 %63 
                          Private f32* %65 = OpAccessChain %39 %41 
                                               OpStore %65 %64 
                        Uniform f32_4* %67 = OpAccessChain %30 %57 
                                 f32_4 %68 = OpLoad %67 
                                   f32 %69 = OpDot %68 %63 
                                               OpStore %66 %69 
                                   f32 %73 = OpLoad %66 
                                  bool %74 = OpFOrdEqual %73 %62 
                                               OpStore %72 %74 
                                  bool %75 = OpLoad %72 
                                               OpSelectionMerge %79 None 
                                               OpBranchConditional %75 %78 %82 
                                       %78 = OpLabel 
                                 f32_3 %80 = OpLoad %39 
                                 f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                               OpStore %77 %81 
                                               OpBranch %79 
                                       %82 = OpLabel 
                                 f32_4 %83 = OpLoad %25 
                                               OpStore %77 %83 
                                               OpBranch %79 
                                       %79 = OpLabel 
                                 f32_4 %84 = OpLoad %77 
                                               OpStore %25 %84 
                                 f32_4 %85 = OpLoad %25 
                                 f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                               OpStore %39 %86 
                                 f32_3 %87 = OpLoad %39 
                                 f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                 f32_3 %90 = OpCompositeConstruct %62 %62 %62 
                                 f32_3 %91 = OpExtInst %1 43 %87 %89 %90 
                                               OpStore %39 %91 
                                 f32_3 %93 = OpLoad %39 
                                 f32_3 %96 = OpFMul %93 %95 
                                 f32_3 %99 = OpFAdd %96 %98 
                                               OpStore %92 %99 
                                f32_3 %100 = OpLoad %39 
                                f32_3 %101 = OpLoad %92 
                                f32_3 %102 = OpFMul %100 %101 
                                f32_3 %105 = OpFAdd %102 %104 
                                               OpStore %92 %105 
                                f32_3 %107 = OpLoad %39 
                                f32_3 %108 = OpLoad %92 
                                f32_3 %109 = OpFMul %107 %108 
                                               OpStore %106 %109 
                         Uniform i32* %114 = OpAccessChain %30 %112 
                                  i32 %115 = OpLoad %114 
                                 bool %116 = OpINotEqual %115 %57 
                                               OpSelectionMerge %120 None 
                                               OpBranchConditional %116 %119 %122 
                                      %119 = OpLabel 
                                f32_3 %121 = OpLoad %106 
                                               OpStore %118 %121 
                                               OpBranch %120 
                                      %122 = OpLabel 
                                f32_4 %123 = OpLoad %25 
                                f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                               OpStore %118 %124 
                                               OpBranch %120 
                                      %120 = OpLabel 
                                f32_3 %125 = OpLoad %118 
                                f32_4 %126 = OpLoad %111 
                                f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                               OpStore %111 %127 
                         Private f32* %129 = OpAccessChain %25 %128 
                                  f32 %130 = OpLoad %129 
                          Output f32* %132 = OpAccessChain %111 %128 
                                               OpStore %132 %130 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 134
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %22 %111 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate %12 DescriptorSet 12 
                                               OpDecorate %12 Binding 12 
                                               OpDecorate %16 DescriptorSet 16 
                                               OpDecorate %16 Binding 16 
                                               OpDecorate vs_TEXCOORD0 Location 22 
                                               OpDecorate %25 RelaxedPrecision 
                                               OpMemberDecorate %28 0 RelaxedPrecision 
                                               OpMemberDecorate %28 0 Offset 28 
                                               OpMemberDecorate %28 1 RelaxedPrecision 
                                               OpMemberDecorate %28 1 Offset 28 
                                               OpMemberDecorate %28 2 Offset 28 
                                               OpDecorate %28 Block 
                                               OpDecorate %30 DescriptorSet 30 
                                               OpDecorate %30 Binding 30 
                                               OpDecorate %34 RelaxedPrecision 
                                               OpDecorate %35 RelaxedPrecision 
                                               OpDecorate %36 RelaxedPrecision 
                                               OpDecorate %39 RelaxedPrecision 
                                               OpDecorate %44 RelaxedPrecision 
                                               OpDecorate %45 RelaxedPrecision 
                                               OpDecorate %48 RelaxedPrecision 
                                               OpDecorate %49 RelaxedPrecision 
                                               OpDecorate %52 RelaxedPrecision 
                                               OpDecorate %53 RelaxedPrecision 
                                               OpDecorate %54 RelaxedPrecision 
                                               OpDecorate %55 RelaxedPrecision 
                                               OpDecorate %56 RelaxedPrecision 
                                               OpDecorate %59 RelaxedPrecision 
                                               OpDecorate %60 RelaxedPrecision 
                                               OpDecorate %61 RelaxedPrecision 
                                               OpDecorate %64 RelaxedPrecision 
                                               OpDecorate %66 RelaxedPrecision 
                                               OpDecorate %68 RelaxedPrecision 
                                               OpDecorate %69 RelaxedPrecision 
                                               OpDecorate %73 RelaxedPrecision 
                                               OpDecorate %80 RelaxedPrecision 
                                               OpDecorate %81 RelaxedPrecision 
                                               OpDecorate %83 RelaxedPrecision 
                                               OpDecorate %84 RelaxedPrecision 
                                               OpDecorate %85 RelaxedPrecision 
                                               OpDecorate %86 RelaxedPrecision 
                                               OpDecorate %87 RelaxedPrecision 
                                               OpDecorate %89 RelaxedPrecision 
                                               OpDecorate %90 RelaxedPrecision 
                                               OpDecorate %91 RelaxedPrecision 
                                               OpDecorate %92 RelaxedPrecision 
                                               OpDecorate %93 RelaxedPrecision 
                                               OpDecorate %96 RelaxedPrecision 
                                               OpDecorate %99 RelaxedPrecision 
                                               OpDecorate %100 RelaxedPrecision 
                                               OpDecorate %101 RelaxedPrecision 
                                               OpDecorate %102 RelaxedPrecision 
                                               OpDecorate %105 RelaxedPrecision 
                                               OpDecorate %107 RelaxedPrecision 
                                               OpDecorate %108 RelaxedPrecision 
                                               OpDecorate %109 RelaxedPrecision 
                                               OpDecorate %111 RelaxedPrecision 
                                               OpDecorate %111 Location 111 
                                               OpDecorate %123 RelaxedPrecision 
                                               OpDecorate %124 RelaxedPrecision 
                                               OpDecorate %130 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypeVector %6 3 
                                       %21 = OpTypePointer Input %20 
                 Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                        Private f32_4* %25 = OpVariable Private 
                                       %27 = OpTypeInt 32 1 
                                       %28 = OpTypeStruct %7 %7 %27 
                                       %29 = OpTypePointer Uniform %28 
  Uniform struct {f32_4; f32_4; i32;}* %30 = OpVariable Uniform 
                                   i32 %31 = OpConstant 1 
                                       %32 = OpTypePointer Uniform %7 
                                       %38 = OpTypePointer Private %20 
                        Private f32_3* %39 = OpVariable Private 
                                       %40 = OpTypeInt 32 0 
                                   u32 %41 = OpConstant 0 
                                       %42 = OpTypePointer Uniform %6 
                                   u32 %46 = OpConstant 1 
                                       %50 = OpTypePointer Private %6 
                                   i32 %57 = OpConstant 0 
                                   f32 %62 = OpConstant 3.674022E-40 
                                 f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                          Private f32* %66 = OpVariable Private 
                                       %70 = OpTypeBool 
                                       %71 = OpTypePointer Private %70 
                         Private bool* %72 = OpVariable Private 
                                       %76 = OpTypePointer Function %7 
                                   f32 %88 = OpConstant 3.674022E-40 
                        Private f32_3* %92 = OpVariable Private 
                                   f32 %94 = OpConstant 3.674022E-40 
                                 f32_3 %95 = OpConstantComposite %94 %94 %94 
                                   f32 %97 = OpConstant 3.674022E-40 
                                 f32_3 %98 = OpConstantComposite %97 %97 %97 
                                  f32 %103 = OpConstant 3.674022E-40 
                                f32_3 %104 = OpConstantComposite %103 %103 %103 
                       Private f32_3* %106 = OpVariable Private 
                                      %110 = OpTypePointer Output %7 
                        Output f32_4* %111 = OpVariable Output 
                                  i32 %112 = OpConstant 2 
                                      %113 = OpTypePointer Uniform %27 
                                      %117 = OpTypePointer Function %20 
                                  u32 %128 = OpConstant 3 
                                      %131 = OpTypePointer Output %6 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                       Function f32_4* %77 = OpVariable Function 
                      Function f32_3* %118 = OpVariable Function 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_3 %23 = OpLoad vs_TEXCOORD0 
                                 f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                               OpStore %9 %24 
                                 f32_4 %26 = OpLoad %9 
                        Uniform f32_4* %33 = OpAccessChain %30 %31 
                                 f32_4 %34 = OpLoad %33 
                                 f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                 f32_4 %36 = OpFNegate %35 
                                 f32_4 %37 = OpFAdd %26 %36 
                                               OpStore %25 %37 
                          Uniform f32* %43 = OpAccessChain %30 %31 %41 
                                   f32 %44 = OpLoad %43 
                                   f32 %45 = OpFNegate %44 
                          Uniform f32* %47 = OpAccessChain %30 %31 %46 
                                   f32 %48 = OpLoad %47 
                                   f32 %49 = OpFAdd %45 %48 
                          Private f32* %51 = OpAccessChain %39 %41 
                                               OpStore %51 %49 
                                 f32_4 %52 = OpLoad %25 
                                 f32_3 %53 = OpLoad %39 
                                 f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                                 f32_4 %55 = OpFDiv %52 %54 
                                               OpStore %25 %55 
                                 f32_4 %56 = OpLoad %25 
                        Uniform f32_4* %58 = OpAccessChain %30 %57 
                                 f32_4 %59 = OpLoad %58 
                                 f32_4 %60 = OpFMul %56 %59 
                                               OpStore %25 %60 
                                 f32_4 %61 = OpLoad %25 
                                   f32 %64 = OpDot %61 %63 
                          Private f32* %65 = OpAccessChain %39 %41 
                                               OpStore %65 %64 
                        Uniform f32_4* %67 = OpAccessChain %30 %57 
                                 f32_4 %68 = OpLoad %67 
                                   f32 %69 = OpDot %68 %63 
                                               OpStore %66 %69 
                                   f32 %73 = OpLoad %66 
                                  bool %74 = OpFOrdEqual %73 %62 
                                               OpStore %72 %74 
                                  bool %75 = OpLoad %72 
                                               OpSelectionMerge %79 None 
                                               OpBranchConditional %75 %78 %82 
                                       %78 = OpLabel 
                                 f32_3 %80 = OpLoad %39 
                                 f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                               OpStore %77 %81 
                                               OpBranch %79 
                                       %82 = OpLabel 
                                 f32_4 %83 = OpLoad %25 
                                               OpStore %77 %83 
                                               OpBranch %79 
                                       %79 = OpLabel 
                                 f32_4 %84 = OpLoad %77 
                                               OpStore %25 %84 
                                 f32_4 %85 = OpLoad %25 
                                 f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                               OpStore %39 %86 
                                 f32_3 %87 = OpLoad %39 
                                 f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                 f32_3 %90 = OpCompositeConstruct %62 %62 %62 
                                 f32_3 %91 = OpExtInst %1 43 %87 %89 %90 
                                               OpStore %39 %91 
                                 f32_3 %93 = OpLoad %39 
                                 f32_3 %96 = OpFMul %93 %95 
                                 f32_3 %99 = OpFAdd %96 %98 
                                               OpStore %92 %99 
                                f32_3 %100 = OpLoad %39 
                                f32_3 %101 = OpLoad %92 
                                f32_3 %102 = OpFMul %100 %101 
                                f32_3 %105 = OpFAdd %102 %104 
                                               OpStore %92 %105 
                                f32_3 %107 = OpLoad %39 
                                f32_3 %108 = OpLoad %92 
                                f32_3 %109 = OpFMul %107 %108 
                                               OpStore %106 %109 
                         Uniform i32* %114 = OpAccessChain %30 %112 
                                  i32 %115 = OpLoad %114 
                                 bool %116 = OpINotEqual %115 %57 
                                               OpSelectionMerge %120 None 
                                               OpBranchConditional %116 %119 %122 
                                      %119 = OpLabel 
                                f32_3 %121 = OpLoad %106 
                                               OpStore %118 %121 
                                               OpBranch %120 
                                      %122 = OpLabel 
                                f32_4 %123 = OpLoad %25 
                                f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                               OpStore %118 %124 
                                               OpBranch %120 
                                      %120 = OpLabel 
                                f32_3 %125 = OpLoad %118 
                                f32_4 %126 = OpLoad %111 
                                f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                               OpStore %111 %127 
                         Private f32* %129 = OpAccessChain %25 %128 
                                  f32 %130 = OpLoad %129 
                          Output f32* %132 = OpAccessChain %111 %128 
                                               OpStore %132 %130 
                                               OpReturn
                                               OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
}
}
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 154055
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform mediump sampler2DArray _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat16_0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform mediump sampler2DArray _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat16_0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 _Channels;
uniform 	mediump vec4 _Levels;
uniform 	int _UndoOutputSRGB;
uniform mediump sampler2DArray _MainTex;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    u_xlat16_0 = u_xlat16_0 + (-_Levels.xxxx);
    u_xlat16_1.x = (-_Levels.x) + _Levels.y;
    u_xlat16_0 = u_xlat16_0 / u_xlat16_1.xxxx;
    u_xlat16_0 = u_xlat16_0 * _Channels;
    u_xlat16_1.x = dot(u_xlat16_0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat16_4 = dot(_Channels, vec4(1.0, 1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4==1.0);
#else
    u_xlatb2 = u_xlat16_4==1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1.xxxx : u_xlat16_0;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    SV_Target0.xyz = (_UndoOutputSRGB != 0) ? u_xlat2.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 134
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %111 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate %9 RelaxedPrecision 
                                                  OpDecorate %12 RelaxedPrecision 
                                                  OpDecorate %12 DescriptorSet 12 
                                                  OpDecorate %12 Binding 12 
                                                  OpDecorate %13 RelaxedPrecision 
                                                  OpDecorate %16 RelaxedPrecision 
                                                  OpDecorate %16 DescriptorSet 16 
                                                  OpDecorate %16 Binding 16 
                                                  OpDecorate %17 RelaxedPrecision 
                                                  OpDecorate vs_TEXCOORD0 Location 22 
                                                  OpDecorate %25 RelaxedPrecision 
                                                  OpDecorate %26 RelaxedPrecision 
                                                  OpMemberDecorate %28 0 RelaxedPrecision 
                                                  OpMemberDecorate %28 0 Offset 28 
                                                  OpMemberDecorate %28 1 RelaxedPrecision 
                                                  OpMemberDecorate %28 1 Offset 28 
                                                  OpMemberDecorate %28 2 Offset 28 
                                                  OpDecorate %28 Block 
                                                  OpDecorate %30 DescriptorSet 30 
                                                  OpDecorate %30 Binding 30 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %35 RelaxedPrecision 
                                                  OpDecorate %36 RelaxedPrecision 
                                                  OpDecorate %37 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %44 RelaxedPrecision 
                                                  OpDecorate %45 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %52 RelaxedPrecision 
                                                  OpDecorate %53 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %55 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %68 RelaxedPrecision 
                                                  OpDecorate %69 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %84 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %96 RelaxedPrecision 
                                                  OpDecorate %99 RelaxedPrecision 
                                                  OpDecorate %100 RelaxedPrecision 
                                                  OpDecorate %101 RelaxedPrecision 
                                                  OpDecorate %102 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %111 Location 111 
                                                  OpDecorate %123 RelaxedPrecision 
                                                  OpDecorate %124 RelaxedPrecision 
                                                  OpDecorate %130 RelaxedPrecision 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeImage %6 Dim2D 0 1 0 1 Unknown 
                                          %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DArray* %12 = OpVariable UniformConstant 
                                          %14 = OpTypeSampler 
                                          %15 = OpTypePointer UniformConstant %14 
                 UniformConstant sampler* %16 = OpVariable UniformConstant 
                                          %18 = OpTypeSampledImage %10 
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                           Private f32_4* %25 = OpVariable Private 
                                          %27 = OpTypeInt 32 1 
                                          %28 = OpTypeStruct %7 %7 %27 
                                          %29 = OpTypePointer Uniform %28 
     Uniform struct {f32_4; f32_4; i32;}* %30 = OpVariable Uniform 
                                      i32 %31 = OpConstant 1 
                                          %32 = OpTypePointer Uniform %7 
                                          %38 = OpTypePointer Private %20 
                           Private f32_3* %39 = OpVariable Private 
                                          %40 = OpTypeInt 32 0 
                                      u32 %41 = OpConstant 0 
                                          %42 = OpTypePointer Uniform %6 
                                      u32 %46 = OpConstant 1 
                                          %50 = OpTypePointer Private %6 
                                      i32 %57 = OpConstant 0 
                                      f32 %62 = OpConstant 3.674022E-40 
                                    f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                             Private f32* %66 = OpVariable Private 
                                          %70 = OpTypeBool 
                                          %71 = OpTypePointer Private %70 
                            Private bool* %72 = OpVariable Private 
                                          %76 = OpTypePointer Function %7 
                                      f32 %88 = OpConstant 3.674022E-40 
                           Private f32_3* %92 = OpVariable Private 
                                      f32 %94 = OpConstant 3.674022E-40 
                                    f32_3 %95 = OpConstantComposite %94 %94 %94 
                                      f32 %97 = OpConstant 3.674022E-40 
                                    f32_3 %98 = OpConstantComposite %97 %97 %97 
                                     f32 %103 = OpConstant 3.674022E-40 
                                   f32_3 %104 = OpConstantComposite %103 %103 %103 
                          Private f32_3* %106 = OpVariable Private 
                                         %110 = OpTypePointer Output %7 
                           Output f32_4* %111 = OpVariable Output 
                                     i32 %112 = OpConstant 2 
                                         %113 = OpTypePointer Uniform %27 
                                         %117 = OpTypePointer Function %20 
                                     u32 %128 = OpConstant 3 
                                         %131 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                          Function f32_4* %77 = OpVariable Function 
                         Function f32_3* %118 = OpVariable Function 
                 read_only Texture2DArray %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
          read_only Texture2DArraySampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                                    f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                  OpStore %9 %24 
                                    f32_4 %26 = OpLoad %9 
                           Uniform f32_4* %33 = OpAccessChain %30 %31 
                                    f32_4 %34 = OpLoad %33 
                                    f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                    f32_4 %36 = OpFNegate %35 
                                    f32_4 %37 = OpFAdd %26 %36 
                                                  OpStore %25 %37 
                             Uniform f32* %43 = OpAccessChain %30 %31 %41 
                                      f32 %44 = OpLoad %43 
                                      f32 %45 = OpFNegate %44 
                             Uniform f32* %47 = OpAccessChain %30 %31 %46 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFAdd %45 %48 
                             Private f32* %51 = OpAccessChain %39 %41 
                                                  OpStore %51 %49 
                                    f32_4 %52 = OpLoad %25 
                                    f32_3 %53 = OpLoad %39 
                                    f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                                    f32_4 %55 = OpFDiv %52 %54 
                                                  OpStore %25 %55 
                                    f32_4 %56 = OpLoad %25 
                           Uniform f32_4* %58 = OpAccessChain %30 %57 
                                    f32_4 %59 = OpLoad %58 
                                    f32_4 %60 = OpFMul %56 %59 
                                                  OpStore %25 %60 
                                    f32_4 %61 = OpLoad %25 
                                      f32 %64 = OpDot %61 %63 
                             Private f32* %65 = OpAccessChain %39 %41 
                                                  OpStore %65 %64 
                           Uniform f32_4* %67 = OpAccessChain %30 %57 
                                    f32_4 %68 = OpLoad %67 
                                      f32 %69 = OpDot %68 %63 
                                                  OpStore %66 %69 
                                      f32 %73 = OpLoad %66 
                                     bool %74 = OpFOrdEqual %73 %62 
                                                  OpStore %72 %74 
                                     bool %75 = OpLoad %72 
                                                  OpSelectionMerge %79 None 
                                                  OpBranchConditional %75 %78 %82 
                                          %78 = OpLabel 
                                    f32_3 %80 = OpLoad %39 
                                    f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                                  OpStore %77 %81 
                                                  OpBranch %79 
                                          %82 = OpLabel 
                                    f32_4 %83 = OpLoad %25 
                                                  OpStore %77 %83 
                                                  OpBranch %79 
                                          %79 = OpLabel 
                                    f32_4 %84 = OpLoad %77 
                                                  OpStore %25 %84 
                                    f32_4 %85 = OpLoad %25 
                                    f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                                  OpStore %39 %86 
                                    f32_3 %87 = OpLoad %39 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_3 %90 = OpCompositeConstruct %62 %62 %62 
                                    f32_3 %91 = OpExtInst %1 43 %87 %89 %90 
                                                  OpStore %39 %91 
                                    f32_3 %93 = OpLoad %39 
                                    f32_3 %96 = OpFMul %93 %95 
                                    f32_3 %99 = OpFAdd %96 %98 
                                                  OpStore %92 %99 
                                   f32_3 %100 = OpLoad %39 
                                   f32_3 %101 = OpLoad %92 
                                   f32_3 %102 = OpFMul %100 %101 
                                   f32_3 %105 = OpFAdd %102 %104 
                                                  OpStore %92 %105 
                                   f32_3 %107 = OpLoad %39 
                                   f32_3 %108 = OpLoad %92 
                                   f32_3 %109 = OpFMul %107 %108 
                                                  OpStore %106 %109 
                            Uniform i32* %114 = OpAccessChain %30 %112 
                                     i32 %115 = OpLoad %114 
                                    bool %116 = OpINotEqual %115 %57 
                                                  OpSelectionMerge %120 None 
                                                  OpBranchConditional %116 %119 %122 
                                         %119 = OpLabel 
                                   f32_3 %121 = OpLoad %106 
                                                  OpStore %118 %121 
                                                  OpBranch %120 
                                         %122 = OpLabel 
                                   f32_4 %123 = OpLoad %25 
                                   f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                                  OpStore %118 %124 
                                                  OpBranch %120 
                                         %120 = OpLabel 
                                   f32_3 %125 = OpLoad %118 
                                   f32_4 %126 = OpLoad %111 
                                   f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                  OpStore %111 %127 
                            Private f32* %129 = OpAccessChain %25 %128 
                                     f32 %130 = OpLoad %129 
                             Output f32* %132 = OpAccessChain %111 %128 
                                                  OpStore %132 %130 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 134
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %111 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate %9 RelaxedPrecision 
                                                  OpDecorate %12 RelaxedPrecision 
                                                  OpDecorate %12 DescriptorSet 12 
                                                  OpDecorate %12 Binding 12 
                                                  OpDecorate %13 RelaxedPrecision 
                                                  OpDecorate %16 RelaxedPrecision 
                                                  OpDecorate %16 DescriptorSet 16 
                                                  OpDecorate %16 Binding 16 
                                                  OpDecorate %17 RelaxedPrecision 
                                                  OpDecorate vs_TEXCOORD0 Location 22 
                                                  OpDecorate %25 RelaxedPrecision 
                                                  OpDecorate %26 RelaxedPrecision 
                                                  OpMemberDecorate %28 0 RelaxedPrecision 
                                                  OpMemberDecorate %28 0 Offset 28 
                                                  OpMemberDecorate %28 1 RelaxedPrecision 
                                                  OpMemberDecorate %28 1 Offset 28 
                                                  OpMemberDecorate %28 2 Offset 28 
                                                  OpDecorate %28 Block 
                                                  OpDecorate %30 DescriptorSet 30 
                                                  OpDecorate %30 Binding 30 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %35 RelaxedPrecision 
                                                  OpDecorate %36 RelaxedPrecision 
                                                  OpDecorate %37 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %44 RelaxedPrecision 
                                                  OpDecorate %45 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %52 RelaxedPrecision 
                                                  OpDecorate %53 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %55 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %68 RelaxedPrecision 
                                                  OpDecorate %69 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %84 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %96 RelaxedPrecision 
                                                  OpDecorate %99 RelaxedPrecision 
                                                  OpDecorate %100 RelaxedPrecision 
                                                  OpDecorate %101 RelaxedPrecision 
                                                  OpDecorate %102 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %111 Location 111 
                                                  OpDecorate %123 RelaxedPrecision 
                                                  OpDecorate %124 RelaxedPrecision 
                                                  OpDecorate %130 RelaxedPrecision 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeImage %6 Dim2D 0 1 0 1 Unknown 
                                          %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DArray* %12 = OpVariable UniformConstant 
                                          %14 = OpTypeSampler 
                                          %15 = OpTypePointer UniformConstant %14 
                 UniformConstant sampler* %16 = OpVariable UniformConstant 
                                          %18 = OpTypeSampledImage %10 
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                           Private f32_4* %25 = OpVariable Private 
                                          %27 = OpTypeInt 32 1 
                                          %28 = OpTypeStruct %7 %7 %27 
                                          %29 = OpTypePointer Uniform %28 
     Uniform struct {f32_4; f32_4; i32;}* %30 = OpVariable Uniform 
                                      i32 %31 = OpConstant 1 
                                          %32 = OpTypePointer Uniform %7 
                                          %38 = OpTypePointer Private %20 
                           Private f32_3* %39 = OpVariable Private 
                                          %40 = OpTypeInt 32 0 
                                      u32 %41 = OpConstant 0 
                                          %42 = OpTypePointer Uniform %6 
                                      u32 %46 = OpConstant 1 
                                          %50 = OpTypePointer Private %6 
                                      i32 %57 = OpConstant 0 
                                      f32 %62 = OpConstant 3.674022E-40 
                                    f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                             Private f32* %66 = OpVariable Private 
                                          %70 = OpTypeBool 
                                          %71 = OpTypePointer Private %70 
                            Private bool* %72 = OpVariable Private 
                                          %76 = OpTypePointer Function %7 
                                      f32 %88 = OpConstant 3.674022E-40 
                           Private f32_3* %92 = OpVariable Private 
                                      f32 %94 = OpConstant 3.674022E-40 
                                    f32_3 %95 = OpConstantComposite %94 %94 %94 
                                      f32 %97 = OpConstant 3.674022E-40 
                                    f32_3 %98 = OpConstantComposite %97 %97 %97 
                                     f32 %103 = OpConstant 3.674022E-40 
                                   f32_3 %104 = OpConstantComposite %103 %103 %103 
                          Private f32_3* %106 = OpVariable Private 
                                         %110 = OpTypePointer Output %7 
                           Output f32_4* %111 = OpVariable Output 
                                     i32 %112 = OpConstant 2 
                                         %113 = OpTypePointer Uniform %27 
                                         %117 = OpTypePointer Function %20 
                                     u32 %128 = OpConstant 3 
                                         %131 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                          Function f32_4* %77 = OpVariable Function 
                         Function f32_3* %118 = OpVariable Function 
                 read_only Texture2DArray %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
          read_only Texture2DArraySampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                                    f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                  OpStore %9 %24 
                                    f32_4 %26 = OpLoad %9 
                           Uniform f32_4* %33 = OpAccessChain %30 %31 
                                    f32_4 %34 = OpLoad %33 
                                    f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                    f32_4 %36 = OpFNegate %35 
                                    f32_4 %37 = OpFAdd %26 %36 
                                                  OpStore %25 %37 
                             Uniform f32* %43 = OpAccessChain %30 %31 %41 
                                      f32 %44 = OpLoad %43 
                                      f32 %45 = OpFNegate %44 
                             Uniform f32* %47 = OpAccessChain %30 %31 %46 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFAdd %45 %48 
                             Private f32* %51 = OpAccessChain %39 %41 
                                                  OpStore %51 %49 
                                    f32_4 %52 = OpLoad %25 
                                    f32_3 %53 = OpLoad %39 
                                    f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                                    f32_4 %55 = OpFDiv %52 %54 
                                                  OpStore %25 %55 
                                    f32_4 %56 = OpLoad %25 
                           Uniform f32_4* %58 = OpAccessChain %30 %57 
                                    f32_4 %59 = OpLoad %58 
                                    f32_4 %60 = OpFMul %56 %59 
                                                  OpStore %25 %60 
                                    f32_4 %61 = OpLoad %25 
                                      f32 %64 = OpDot %61 %63 
                             Private f32* %65 = OpAccessChain %39 %41 
                                                  OpStore %65 %64 
                           Uniform f32_4* %67 = OpAccessChain %30 %57 
                                    f32_4 %68 = OpLoad %67 
                                      f32 %69 = OpDot %68 %63 
                                                  OpStore %66 %69 
                                      f32 %73 = OpLoad %66 
                                     bool %74 = OpFOrdEqual %73 %62 
                                                  OpStore %72 %74 
                                     bool %75 = OpLoad %72 
                                                  OpSelectionMerge %79 None 
                                                  OpBranchConditional %75 %78 %82 
                                          %78 = OpLabel 
                                    f32_3 %80 = OpLoad %39 
                                    f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                                  OpStore %77 %81 
                                                  OpBranch %79 
                                          %82 = OpLabel 
                                    f32_4 %83 = OpLoad %25 
                                                  OpStore %77 %83 
                                                  OpBranch %79 
                                          %79 = OpLabel 
                                    f32_4 %84 = OpLoad %77 
                                                  OpStore %25 %84 
                                    f32_4 %85 = OpLoad %25 
                                    f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                                  OpStore %39 %86 
                                    f32_3 %87 = OpLoad %39 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_3 %90 = OpCompositeConstruct %62 %62 %62 
                                    f32_3 %91 = OpExtInst %1 43 %87 %89 %90 
                                                  OpStore %39 %91 
                                    f32_3 %93 = OpLoad %39 
                                    f32_3 %96 = OpFMul %93 %95 
                                    f32_3 %99 = OpFAdd %96 %98 
                                                  OpStore %92 %99 
                                   f32_3 %100 = OpLoad %39 
                                   f32_3 %101 = OpLoad %92 
                                   f32_3 %102 = OpFMul %100 %101 
                                   f32_3 %105 = OpFAdd %102 %104 
                                                  OpStore %92 %105 
                                   f32_3 %107 = OpLoad %39 
                                   f32_3 %108 = OpLoad %92 
                                   f32_3 %109 = OpFMul %107 %108 
                                                  OpStore %106 %109 
                            Uniform i32* %114 = OpAccessChain %30 %112 
                                     i32 %115 = OpLoad %114 
                                    bool %116 = OpINotEqual %115 %57 
                                                  OpSelectionMerge %120 None 
                                                  OpBranchConditional %116 %119 %122 
                                         %119 = OpLabel 
                                   f32_3 %121 = OpLoad %106 
                                                  OpStore %118 %121 
                                                  OpBranch %120 
                                         %122 = OpLabel 
                                   f32_4 %123 = OpLoad %25 
                                   f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                                  OpStore %118 %124 
                                                  OpBranch %120 
                                         %120 = OpLabel 
                                   f32_3 %125 = OpLoad %118 
                                   f32_4 %126 = OpLoad %111 
                                   f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                  OpStore %111 %127 
                            Private f32* %129 = OpAccessChain %25 %128 
                                     f32 %130 = OpLoad %129 
                             Output f32* %132 = OpAccessChain %111 %128 
                                                  OpStore %132 %130 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 Location 86 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 134
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %111 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate %9 RelaxedPrecision 
                                                  OpDecorate %12 RelaxedPrecision 
                                                  OpDecorate %12 DescriptorSet 12 
                                                  OpDecorate %12 Binding 12 
                                                  OpDecorate %13 RelaxedPrecision 
                                                  OpDecorate %16 RelaxedPrecision 
                                                  OpDecorate %16 DescriptorSet 16 
                                                  OpDecorate %16 Binding 16 
                                                  OpDecorate %17 RelaxedPrecision 
                                                  OpDecorate vs_TEXCOORD0 Location 22 
                                                  OpDecorate %25 RelaxedPrecision 
                                                  OpDecorate %26 RelaxedPrecision 
                                                  OpMemberDecorate %28 0 RelaxedPrecision 
                                                  OpMemberDecorate %28 0 Offset 28 
                                                  OpMemberDecorate %28 1 RelaxedPrecision 
                                                  OpMemberDecorate %28 1 Offset 28 
                                                  OpMemberDecorate %28 2 Offset 28 
                                                  OpDecorate %28 Block 
                                                  OpDecorate %30 DescriptorSet 30 
                                                  OpDecorate %30 Binding 30 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %35 RelaxedPrecision 
                                                  OpDecorate %36 RelaxedPrecision 
                                                  OpDecorate %37 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %44 RelaxedPrecision 
                                                  OpDecorate %45 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %52 RelaxedPrecision 
                                                  OpDecorate %53 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %55 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %68 RelaxedPrecision 
                                                  OpDecorate %69 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %84 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %96 RelaxedPrecision 
                                                  OpDecorate %99 RelaxedPrecision 
                                                  OpDecorate %100 RelaxedPrecision 
                                                  OpDecorate %101 RelaxedPrecision 
                                                  OpDecorate %102 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %111 Location 111 
                                                  OpDecorate %123 RelaxedPrecision 
                                                  OpDecorate %124 RelaxedPrecision 
                                                  OpDecorate %130 RelaxedPrecision 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypeImage %6 Dim2D 0 1 0 1 Unknown 
                                          %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DArray* %12 = OpVariable UniformConstant 
                                          %14 = OpTypeSampler 
                                          %15 = OpTypePointer UniformConstant %14 
                 UniformConstant sampler* %16 = OpVariable UniformConstant 
                                          %18 = OpTypeSampledImage %10 
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                           Private f32_4* %25 = OpVariable Private 
                                          %27 = OpTypeInt 32 1 
                                          %28 = OpTypeStruct %7 %7 %27 
                                          %29 = OpTypePointer Uniform %28 
     Uniform struct {f32_4; f32_4; i32;}* %30 = OpVariable Uniform 
                                      i32 %31 = OpConstant 1 
                                          %32 = OpTypePointer Uniform %7 
                                          %38 = OpTypePointer Private %20 
                           Private f32_3* %39 = OpVariable Private 
                                          %40 = OpTypeInt 32 0 
                                      u32 %41 = OpConstant 0 
                                          %42 = OpTypePointer Uniform %6 
                                      u32 %46 = OpConstant 1 
                                          %50 = OpTypePointer Private %6 
                                      i32 %57 = OpConstant 0 
                                      f32 %62 = OpConstant 3.674022E-40 
                                    f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                             Private f32* %66 = OpVariable Private 
                                          %70 = OpTypeBool 
                                          %71 = OpTypePointer Private %70 
                            Private bool* %72 = OpVariable Private 
                                          %76 = OpTypePointer Function %7 
                                      f32 %88 = OpConstant 3.674022E-40 
                           Private f32_3* %92 = OpVariable Private 
                                      f32 %94 = OpConstant 3.674022E-40 
                                    f32_3 %95 = OpConstantComposite %94 %94 %94 
                                      f32 %97 = OpConstant 3.674022E-40 
                                    f32_3 %98 = OpConstantComposite %97 %97 %97 
                                     f32 %103 = OpConstant 3.674022E-40 
                                   f32_3 %104 = OpConstantComposite %103 %103 %103 
                          Private f32_3* %106 = OpVariable Private 
                                         %110 = OpTypePointer Output %7 
                           Output f32_4* %111 = OpVariable Output 
                                     i32 %112 = OpConstant 2 
                                         %113 = OpTypePointer Uniform %27 
                                         %117 = OpTypePointer Function %20 
                                     u32 %128 = OpConstant 3 
                                         %131 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                          Function f32_4* %77 = OpVariable Function 
                         Function f32_3* %118 = OpVariable Function 
                 read_only Texture2DArray %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
          read_only Texture2DArraySampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                                    f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                  OpStore %9 %24 
                                    f32_4 %26 = OpLoad %9 
                           Uniform f32_4* %33 = OpAccessChain %30 %31 
                                    f32_4 %34 = OpLoad %33 
                                    f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                    f32_4 %36 = OpFNegate %35 
                                    f32_4 %37 = OpFAdd %26 %36 
                                                  OpStore %25 %37 
                             Uniform f32* %43 = OpAccessChain %30 %31 %41 
                                      f32 %44 = OpLoad %43 
                                      f32 %45 = OpFNegate %44 
                             Uniform f32* %47 = OpAccessChain %30 %31 %46 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFAdd %45 %48 
                             Private f32* %51 = OpAccessChain %39 %41 
                                                  OpStore %51 %49 
                                    f32_4 %52 = OpLoad %25 
                                    f32_3 %53 = OpLoad %39 
                                    f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                                    f32_4 %55 = OpFDiv %52 %54 
                                                  OpStore %25 %55 
                                    f32_4 %56 = OpLoad %25 
                           Uniform f32_4* %58 = OpAccessChain %30 %57 
                                    f32_4 %59 = OpLoad %58 
                                    f32_4 %60 = OpFMul %56 %59 
                                                  OpStore %25 %60 
                                    f32_4 %61 = OpLoad %25 
                                      f32 %64 = OpDot %61 %63 
                             Private f32* %65 = OpAccessChain %39 %41 
                                                  OpStore %65 %64 
                           Uniform f32_4* %67 = OpAccessChain %30 %57 
                                    f32_4 %68 = OpLoad %67 
                                      f32 %69 = OpDot %68 %63 
                                                  OpStore %66 %69 
                                      f32 %73 = OpLoad %66 
                                     bool %74 = OpFOrdEqual %73 %62 
                                                  OpStore %72 %74 
                                     bool %75 = OpLoad %72 
                                                  OpSelectionMerge %79 None 
                                                  OpBranchConditional %75 %78 %82 
                                          %78 = OpLabel 
                                    f32_3 %80 = OpLoad %39 
                                    f32_4 %81 = OpVectorShuffle %80 %80 0 0 0 0 
                                                  OpStore %77 %81 
                                                  OpBranch %79 
                                          %82 = OpLabel 
                                    f32_4 %83 = OpLoad %25 
                                                  OpStore %77 %83 
                                                  OpBranch %79 
                                          %79 = OpLabel 
                                    f32_4 %84 = OpLoad %77 
                                                  OpStore %25 %84 
                                    f32_4 %85 = OpLoad %25 
                                    f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                                  OpStore %39 %86 
                                    f32_3 %87 = OpLoad %39 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_3 %90 = OpCompositeConstruct %62 %62 %62 
                                    f32_3 %91 = OpExtInst %1 43 %87 %89 %90 
                                                  OpStore %39 %91 
                                    f32_3 %93 = OpLoad %39 
                                    f32_3 %96 = OpFMul %93 %95 
                                    f32_3 %99 = OpFAdd %96 %98 
                                                  OpStore %92 %99 
                                   f32_3 %100 = OpLoad %39 
                                   f32_3 %101 = OpLoad %92 
                                   f32_3 %102 = OpFMul %100 %101 
                                   f32_3 %105 = OpFAdd %102 %104 
                                                  OpStore %92 %105 
                                   f32_3 %107 = OpLoad %39 
                                   f32_3 %108 = OpLoad %92 
                                   f32_3 %109 = OpFMul %107 %108 
                                                  OpStore %106 %109 
                            Uniform i32* %114 = OpAccessChain %30 %112 
                                     i32 %115 = OpLoad %114 
                                    bool %116 = OpINotEqual %115 %57 
                                                  OpSelectionMerge %120 None 
                                                  OpBranchConditional %116 %119 %122 
                                         %119 = OpLabel 
                                   f32_3 %121 = OpLoad %106 
                                                  OpStore %118 %121 
                                                  OpBranch %120 
                                         %122 = OpLabel 
                                   f32_4 %123 = OpLoad %25 
                                   f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                                  OpStore %118 %124 
                                                  OpBranch %120 
                                         %120 = OpLabel 
                                   f32_3 %125 = OpLoad %118 
                                   f32_4 %126 = OpLoad %111 
                                   f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                  OpStore %111 %127 
                            Private f32* %129 = OpAccessChain %25 %128 
                                     f32 %130 = OpLoad %129 
                             Output f32* %132 = OpAccessChain %111 %128 
                                                  OpStore %132 %130 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
}
}
}
}