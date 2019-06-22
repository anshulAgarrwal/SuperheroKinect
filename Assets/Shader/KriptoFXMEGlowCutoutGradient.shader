Shader "KriptoFX/ME/GlowCutoutGradient" {
	Properties {
		[HDR] _TintColor ("Tint Color", Vector) = (0.5,0.5,0.5,1)
		_GradientStrength ("Gradient Strength", Float) = 0.5
		_TimeScale ("Time Scale", Vector) = (1,1,1,1)
		_MainTex ("Noise Texture", 2D) = "white" {}
		_BorderScale ("Border Scale (XY) Offset (Z)", Vector) = (0.5,0.05,1,1)
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Offset -1, -1
			GpuProgramID 41659
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
					// NORMAL                   0   xyz         4     NONE   float   xyz 
					//
					vs_4_0
					dcl_constantbuffer CB0[7], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_input v3.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o3.xyzw
					dcl_output o4.xyz
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mov o1.xyzw, v1.xyzw
					mad o2.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mov r0.x, cb1[0].x
					mov r0.y, cb1[1].x
					mov r0.z, cb1[2].x
					dp3 r0.x, r0.xyzx, r0.xyzx
					sqrt r0.x, r0.x
					mov r1.x, cb1[0].y
					mov r1.y, cb1[1].y
					mov r1.z, cb1[2].y
					dp3 r1.x, r1.xyzx, r1.xyzx
					sqrt r0.y, r1.x
					mov r1.x, cb1[0].z
					mov r1.y, cb1[1].z
					mov r1.z, cb1[2].z
					dp3 r1.x, r1.xyzx, r1.xyzx
					sqrt r0.zw, r1.xxxx
					mul r0.xyzw, r0.xyzw, v0.xyzz
					mul o3.xyzw, r0.xyzw, cb0[6].xyxy
					mov o4.xyz, |v3.xyzx|
					ret 
					// Approximately 0 instruction slots used"
				}
				SubProgram "d3d11 " {
					Keywords { "KRIPTO_FX_LWRP_RENDERING" }
					"!!vs_4_0
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
					// NORMAL                   0   xyz         4     NONE   float   xyz 
					//
					vs_4_0
					dcl_constantbuffer CB0[7], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_input v3.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o3.xyzw
					dcl_output o4.xyz
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mov o1.xyzw, v1.xyzw
					mad o2.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mov r0.x, cb1[0].x
					mov r0.y, cb1[1].x
					mov r0.z, cb1[2].x
					dp3 r0.x, r0.xyzx, r0.xyzx
					sqrt r0.x, r0.x
					mov r1.x, cb1[0].y
					mov r1.y, cb1[1].y
					mov r1.z, cb1[2].y
					dp3 r1.x, r1.xyzx, r1.xyzx
					sqrt r0.y, r1.x
					mov r1.x, cb1[0].z
					mov r1.y, cb1[1].z
					mov r1.z, cb1[2].z
					dp3 r1.x, r1.xyzx, r1.xyzx
					sqrt r0.zw, r1.xxxx
					mul r0.xyzw, r0.xyzw, v0.xyzz
					mul o3.xyzw, r0.xyzw, cb0[6].xyxy
					mov o4.xyz, |v3.xyzx|
					ret 
					// Approximately 0 instruction slots used"
				}
				SubProgram "d3d11 " {
					Keywords { "KRIPTO_FX_HDRP_RENDERING" }
					"!!vs_4_0
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float   xyzw
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
					// NORMAL                   0   xyz         4     NONE   float   xyz 
					//
					vs_4_0
					dcl_constantbuffer CB0[7], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_input v3.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o3.xyzw
					dcl_output o4.xyz
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mov o1.xyzw, v1.xyzw
					mad o2.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mov r0.x, cb1[0].x
					mov r0.y, cb1[1].x
					mov r0.z, cb1[2].x
					dp3 r0.x, r0.xyzx, r0.xyzx
					sqrt r0.x, r0.x
					mov r1.x, cb1[0].y
					mov r1.y, cb1[1].y
					mov r1.z, cb1[2].y
					dp3 r1.x, r1.xyzx, r1.xyzx
					sqrt r0.y, r1.x
					mov r1.x, cb1[0].z
					mov r1.y, cb1[1].z
					mov r1.z, cb1[2].z
					dp3 r1.x, r1.xyzx, r1.xyzx
					sqrt r0.zw, r1.xxxx
					mul r0.xyzw, r0.xyzw, v0.xyzz
					mul o3.xyzw, r0.xyzw, cb0[6].xyxy
					mov o4.xyz, |v3.xyzx|
					ret 
					// Approximately 0 instruction slots used"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float       
					// COLOR                    0   xyzw        1     NONE   float   xyz 
					// TEXCOORD                 0   xy          2     NONE   float       
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
					// NORMAL                   0   xyz         4     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_constantbuffer CB1[1], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyz
					dcl_input_ps linear v3.xyzw
					dcl_input_ps linear v4.xyz
					dcl_output o0.xyzw
					dcl_temps 5
					mad r0.xy, cb1[0].xxxx, cb0[3].xyxx, v3.xyxx
					sample r0.xyzw, r0.xyxx, t0.yzxw, s0
					mad r1.xyzw, cb1[0].xxxx, cb0[3].xyxy, v3.zyxw
					sample r2.xyzw, r1.xyxx, t0.xyzw, s0
					sample r1.xyzw, r1.zwzz, t0.xyzw, s0
					mov r0.y, r1.x
					mov r0.x, r2.x
					add r0.w, v4.y, v4.x
					add r0.w, r0.w, v4.z
					div r1.xyz, v4.xyzx, r0.wwww
					dp3 r0.x, r0.xyzx, r1.xyzx
					mul r0.y, r0.x, cb0[4].x
					mad r0.yz, cb1[0].xxxx, cb0[3].zzwz, r0.yyyy
					add r2.xy, r0.yzyy, v3.xyxx
					add r3.xyzw, r0.yzyz, v3.zyxw
					sample r2.xyzw, r2.xyxx, t0.yzxw, s0
					sample r4.xyzw, r3.xyxx, t0.xyzw, s0
					sample r3.xyzw, r3.zwzz, t0.xyzw, s0
					mov r2.y, r3.x
					mov r2.x, r4.x
					dp3 r0.y, r2.xyzx, r1.xyzx
					mul r0.y, r0.x, r0.y
					mad r0.x, r0.x, cb0[4].y, l(0.300000)
					mul r2.xyz, v1.xyzx, cb0[2].xyzx
					mul r0.yzw, r0.yyyy, r2.xxyz
					add r2.xy, r0.xxxx, v3.xyxx
					add r3.xyzw, r0.xxxx, v3.zyxw
					sample r2.xyzw, r2.xyxx, t0.yzxw, s0
					sample r4.xyzw, r3.xyxx, t0.xyzw, s0
					sample r3.xyzw, r3.zwzz, t0.xyzw, s0
					mov r2.y, r3.x
					mov r2.x, r4.x
					dp3 r0.x, r2.xyzx, r1.xyzx
					mul r0.xyz, r0.yzwy, r0.xxxx
					log r0.xyz, r0.xyzx
					mul r0.xyz, r0.xyzx, cb0[4].wwww
					exp r0.xyz, r0.xyzx
					add_sat r1.xyz, r0.xyzx, cb0[5].xxxx
					dp3 r0.w, r1.xyzx, l(0.330000, 0.330000, 0.330000, 0.000000)
					mul o0.xyzw, r0.xyzw, cb0[2].wwww
					ret 
					// Approximately 0 instruction slots used"
				}
				SubProgram "d3d11 " {
					Keywords { "KRIPTO_FX_LWRP_RENDERING" }
					"!!ps_4_0
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float       
					// COLOR                    0   xyzw        1     NONE   float   xyz 
					// TEXCOORD                 0   xy          2     NONE   float       
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
					// NORMAL                   0   xyz         4     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_constantbuffer CB1[1], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyz
					dcl_input_ps linear v3.xyzw
					dcl_input_ps linear v4.xyz
					dcl_output o0.xyzw
					dcl_temps 5
					mad r0.xy, cb1[0].xxxx, cb0[3].xyxx, v3.xyxx
					sample r0.xyzw, r0.xyxx, t0.yzxw, s0
					mad r1.xyzw, cb1[0].xxxx, cb0[3].xyxy, v3.zyxw
					sample r2.xyzw, r1.xyxx, t0.xyzw, s0
					sample r1.xyzw, r1.zwzz, t0.xyzw, s0
					mov r0.y, r1.x
					mov r0.x, r2.x
					add r0.w, v4.y, v4.x
					add r0.w, r0.w, v4.z
					div r1.xyz, v4.xyzx, r0.wwww
					dp3 r0.x, r0.xyzx, r1.xyzx
					mul r0.y, r0.x, cb0[4].x
					mad r0.yz, cb1[0].xxxx, cb0[3].zzwz, r0.yyyy
					add r2.xy, r0.yzyy, v3.xyxx
					add r3.xyzw, r0.yzyz, v3.zyxw
					sample r2.xyzw, r2.xyxx, t0.yzxw, s0
					sample r4.xyzw, r3.xyxx, t0.xyzw, s0
					sample r3.xyzw, r3.zwzz, t0.xyzw, s0
					mov r2.y, r3.x
					mov r2.x, r4.x
					dp3 r0.y, r2.xyzx, r1.xyzx
					mul r0.y, r0.x, r0.y
					mad r0.x, r0.x, cb0[4].y, l(0.300000)
					mul r2.xyz, v1.xyzx, cb0[2].xyzx
					mul r0.yzw, r0.yyyy, r2.xxyz
					add r2.xy, r0.xxxx, v3.xyxx
					add r3.xyzw, r0.xxxx, v3.zyxw
					sample r2.xyzw, r2.xyxx, t0.yzxw, s0
					sample r4.xyzw, r3.xyxx, t0.xyzw, s0
					sample r3.xyzw, r3.zwzz, t0.xyzw, s0
					mov r2.y, r3.x
					mov r2.x, r4.x
					dp3 r0.x, r2.xyzx, r1.xyzx
					mul r0.xyz, r0.yzwy, r0.xxxx
					log r0.xyz, r0.xyzx
					mul r0.xyz, r0.xyzx, cb0[4].wwww
					exp r0.xyz, r0.xyzx
					add_sat r1.xyz, r0.xyzx, cb0[5].xxxx
					dp3 r0.w, r1.xyzx, l(0.330000, 0.330000, 0.330000, 0.000000)
					mul o0.xyzw, r0.xyzw, cb0[2].wwww
					ret 
					// Approximately 0 instruction slots used"
				}
				SubProgram "d3d11 " {
					Keywords { "KRIPTO_FX_HDRP_RENDERING" }
					"!!ps_4_0
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Position              0   xyzw        0      POS   float       
					// COLOR                    0   xyzw        1     NONE   float   xyz 
					// TEXCOORD                 0   xy          2     NONE   float       
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
					// NORMAL                   0   xyz         4     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_constantbuffer CB1[1], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyz
					dcl_input_ps linear v3.xyzw
					dcl_input_ps linear v4.xyz
					dcl_output o0.xyzw
					dcl_temps 5
					mad r0.xy, cb1[0].xxxx, cb0[3].xyxx, v3.xyxx
					sample r0.xyzw, r0.xyxx, t0.yzxw, s0
					mad r1.xyzw, cb1[0].xxxx, cb0[3].xyxy, v3.zyxw
					sample r2.xyzw, r1.xyxx, t0.xyzw, s0
					sample r1.xyzw, r1.zwzz, t0.xyzw, s0
					mov r0.y, r1.x
					mov r0.x, r2.x
					add r0.w, v4.y, v4.x
					add r0.w, r0.w, v4.z
					div r1.xyz, v4.xyzx, r0.wwww
					dp3 r0.x, r0.xyzx, r1.xyzx
					mul r0.y, r0.x, cb0[4].x
					mad r0.yz, cb1[0].xxxx, cb0[3].zzwz, r0.yyyy
					add r2.xy, r0.yzyy, v3.xyxx
					add r3.xyzw, r0.yzyz, v3.zyxw
					sample r2.xyzw, r2.xyxx, t0.yzxw, s0
					sample r4.xyzw, r3.xyxx, t0.xyzw, s0
					sample r3.xyzw, r3.zwzz, t0.xyzw, s0
					mov r2.y, r3.x
					mov r2.x, r4.x
					dp3 r0.y, r2.xyzx, r1.xyzx
					mul r0.y, r0.x, r0.y
					mad r0.x, r0.x, cb0[4].y, l(0.300000)
					mul r2.xyz, v1.xyzx, cb0[2].xyzx
					log r2.xyz, r2.xyzx
					mul r2.xyz, r2.xyzx, l(2.200000, 2.200000, 2.200000, 0.000000)
					exp r2.xyz, r2.xyzx
					mul r0.yzw, r0.yyyy, r2.xxyz
					add r2.xy, r0.xxxx, v3.xyxx
					add r3.xyzw, r0.xxxx, v3.zyxw
					sample r2.xyzw, r2.xyxx, t0.yzxw, s0
					sample r4.xyzw, r3.xyxx, t0.xyzw, s0
					sample r3.xyzw, r3.zwzz, t0.xyzw, s0
					mov r2.y, r3.x
					mov r2.x, r4.x
					dp3 r0.x, r2.xyzx, r1.xyzx
					mul r0.xyz, r0.yzwy, r0.xxxx
					log r0.xyz, r0.xyzx
					mul r0.xyz, r0.xyzx, cb0[4].wwww
					exp r0.xyz, r0.xyzx
					add_sat r1.xyz, r0.xyzx, cb0[5].xxxx
					dp3 r0.w, r1.xyzx, l(0.330000, 0.330000, 0.330000, 0.000000)
					mul o0.xyzw, r0.xyzw, cb0[2].wwww
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}