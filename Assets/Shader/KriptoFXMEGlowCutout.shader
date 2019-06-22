Shader "KriptoFX/ME/GlowCutout" {
	Properties {
		[HDR] _TintColor ("Tint Color", Vector) = (0.5,0.5,0.5,1)
		_TimeScale ("Time Scale", Vector) = (1,1,1,1)
		_MainTex ("Noise Texture", 2D) = "white" {}
		_BorderScale ("Border Scale (XY) Offset (Z)", Vector) = (0.5,0.05,1,0)
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Offset -1, -1
			GpuProgramID 17299
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
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					// TEXCOORD                 1   xyz         4     NONE   float   xyz 
					//
					vs_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_input v3.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o3.xyz
					dcl_output o4.xyz
					dcl_temps 3
					mul r0.xyz, v3.xyzx, cb0[4].zzzz
					mad r0.xyz, r0.xyzx, l(0.010000, 0.010000, 0.010000, 0.000000), v0.xyzx
					mul r1.xyzw, r0.yyyy, cb1[1].xyzw
					mad r1.xyzw, cb1[0].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb1[2].xyzw, r0.zzzz, r1.xyzw
					add r1.xyzw, r1.xyzw, cb1[3].xyzw
					mul r2.xyzw, r1.yyyy, cb2[18].xyzw
					mad r2.xyzw, cb2[17].xyzw, r1.xxxx, r2.xyzw
					mad r2.xyzw, cb2[19].xyzw, r1.zzzz, r2.xyzw
					mad o0.xyzw, cb2[20].xyzw, r1.wwww, r2.xyzw
					mov o1.xyzw, v1.xyzw
					mad o2.xy, v2.xyxx, cb0[5].xyxx, cb0[5].zwzz
					mov o3.xyz, |v3.xyzx|
					mov r1.x, cb1[0].x
					mov r1.y, cb1[1].x
					mov r1.z, cb1[2].x
					dp3 r0.w, r1.xyzx, r1.xyzx
					sqrt r1.x, r0.w
					mov r2.x, cb1[0].y
					mov r2.y, cb1[1].y
					mov r2.z, cb1[2].y
					dp3 r0.w, r2.xyzx, r2.xyzx
					sqrt r1.y, r0.w
					mov r2.x, cb1[0].z
					mov r2.y, cb1[1].z
					mov r2.z, cb1[2].z
					dp3 r0.w, r2.xyzx, r2.xyzx
					sqrt r1.z, r0.w
					mul r0.xyz, r0.xyzx, r1.xyzx
					mul o4.xyz, r0.xyzx, cb0[5].xxxx
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
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					// TEXCOORD                 1   xyz         4     NONE   float   xyz 
					//
					vs_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_input v3.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o3.xyz
					dcl_output o4.xyz
					dcl_temps 3
					mul r0.xyz, v3.xyzx, cb0[4].zzzz
					mad r0.xyz, r0.xyzx, l(0.010000, 0.010000, 0.010000, 0.000000), v0.xyzx
					mul r1.xyzw, r0.yyyy, cb1[1].xyzw
					mad r1.xyzw, cb1[0].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb1[2].xyzw, r0.zzzz, r1.xyzw
					add r1.xyzw, r1.xyzw, cb1[3].xyzw
					mul r2.xyzw, r1.yyyy, cb2[18].xyzw
					mad r2.xyzw, cb2[17].xyzw, r1.xxxx, r2.xyzw
					mad r2.xyzw, cb2[19].xyzw, r1.zzzz, r2.xyzw
					mad o0.xyzw, cb2[20].xyzw, r1.wwww, r2.xyzw
					mov o1.xyzw, v1.xyzw
					mad o2.xy, v2.xyxx, cb0[5].xyxx, cb0[5].zwzz
					mov o3.xyz, |v3.xyzx|
					mov r1.x, cb1[0].x
					mov r1.y, cb1[1].x
					mov r1.z, cb1[2].x
					dp3 r0.w, r1.xyzx, r1.xyzx
					sqrt r1.x, r0.w
					mov r2.x, cb1[0].y
					mov r2.y, cb1[1].y
					mov r2.z, cb1[2].y
					dp3 r0.w, r2.xyzx, r2.xyzx
					sqrt r1.y, r0.w
					mov r2.x, cb1[0].z
					mov r2.y, cb1[1].z
					mov r2.z, cb1[2].z
					dp3 r0.w, r2.xyzx, r2.xyzx
					sqrt r1.z, r0.w
					mul r0.xyz, r0.xyzx, r1.xyzx
					mul o4.xyz, r0.xyzx, cb0[5].xxxx
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
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					// TEXCOORD                 1   xyz         4     NONE   float   xyz 
					//
					vs_4_0
					dcl_constantbuffer CB0[6], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_input v3.xyz
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o3.xyz
					dcl_output o4.xyz
					dcl_temps 3
					mul r0.xyz, v3.xyzx, cb0[4].zzzz
					mad r0.xyz, r0.xyzx, l(0.010000, 0.010000, 0.010000, 0.000000), v0.xyzx
					mul r1.xyzw, r0.yyyy, cb1[1].xyzw
					mad r1.xyzw, cb1[0].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb1[2].xyzw, r0.zzzz, r1.xyzw
					add r1.xyzw, r1.xyzw, cb1[3].xyzw
					mul r2.xyzw, r1.yyyy, cb2[18].xyzw
					mad r2.xyzw, cb2[17].xyzw, r1.xxxx, r2.xyzw
					mad r2.xyzw, cb2[19].xyzw, r1.zzzz, r2.xyzw
					mad o0.xyzw, cb2[20].xyzw, r1.wwww, r2.xyzw
					mov o1.xyzw, v1.xyzw
					mad o2.xy, v2.xyxx, cb0[5].xyxx, cb0[5].zwzz
					mov o3.xyz, |v3.xyzx|
					mov r1.x, cb1[0].x
					mov r1.y, cb1[1].x
					mov r1.z, cb1[2].x
					dp3 r0.w, r1.xyzx, r1.xyzx
					sqrt r1.x, r0.w
					mov r2.x, cb1[0].y
					mov r2.y, cb1[1].y
					mov r2.z, cb1[2].y
					dp3 r0.w, r2.xyzx, r2.xyzx
					sqrt r1.y, r0.w
					mov r2.x, cb1[0].z
					mov r2.y, cb1[1].z
					mov r2.z, cb1[2].z
					dp3 r0.w, r2.xyzx, r2.xyzx
					sqrt r1.z, r0.w
					mul r0.xyz, r0.xyzx, r1.xyzx
					mul o4.xyz, r0.xyzx, cb0[5].xxxx
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
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float       
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					// TEXCOORD                 1   xyz         4     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[5], immediateIndexed
					dcl_constantbuffer CB1[1], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v3.xyz
					dcl_input_ps linear v4.xyz
					dcl_output o0.xyzw
					dcl_temps 4
					mad r0.xy, cb1[0].xxxx, cb0[3].xyxx, v4.xyxx
					sample r0.xyzw, r0.xyxx, t0.xyzw, s0
					mad r1.xyzw, cb1[0].xxxx, cb0[3].xyxy, v4.xzzy
					sample r2.xyzw, r1.zwzz, t0.xyzw, s0
					sample r1.xyzw, r1.xyxx, t0.xyzw, s0
					add r0.z, v3.y, v3.x
					add r0.z, r0.z, v3.z
					div r3.xyz, v3.xyzx, r0.zzzz
					mul r0.zw, r1.xxxy, r3.yyyy
					mad r0.zw, r2.xxxy, r3.xxxx, r0.zzzw
					mad r0.xy, r0.xyxx, r3.zzzz, r0.zwzz
					mad r0.xy, cb1[0].xxxx, cb0[3].zwzz, r0.xyxx
					add r1.xyzw, r0.xyxy, v4.xzzy
					add r0.xy, r0.xyxx, v4.xyxx
					sample r0.xyzw, r0.xyxx, t0.xyzw, s0
					sample r2.xyzw, r1.xyxx, t0.xyzw, s0
					sample r1.xyzw, r1.zwzz, t0.xyzw, s0
					mul r0.zw, r3.yyyy, r2.xxxy
					mad r0.zw, r1.xxxy, r3.xxxx, r0.zzzw
					mad r0.xy, r0.xyxx, r3.zzzz, r0.zwzz
					add r0.z, -cb0[4].y, cb0[4].x
					ge r0.z, r0.z, r0.x
					movc r0.z, r0.z, l(-1.000000), l(-0.000000)
					ge r0.x, cb0[4].x, r0.x
					and r0.x, r0.x, l(0x3f800000)
					add r0.x, r0.z, r0.x
					mul r0.x, r0.y, r0.x
					mul r0.xyzw, r0.xxxx, v1.xyzw
					mul r0.xyzw, r0.xyzw, cb0[2].xyzw
					mov_sat r0.w, r0.w
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
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float       
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					// TEXCOORD                 1   xyz         4     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[5], immediateIndexed
					dcl_constantbuffer CB1[1], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v3.xyz
					dcl_input_ps linear v4.xyz
					dcl_output o0.xyzw
					dcl_temps 4
					mad r0.xy, cb1[0].xxxx, cb0[3].xyxx, v4.xyxx
					sample r0.xyzw, r0.xyxx, t0.xyzw, s0
					mad r1.xyzw, cb1[0].xxxx, cb0[3].xyxy, v4.xzzy
					sample r2.xyzw, r1.zwzz, t0.xyzw, s0
					sample r1.xyzw, r1.xyxx, t0.xyzw, s0
					add r0.z, v3.y, v3.x
					add r0.z, r0.z, v3.z
					div r3.xyz, v3.xyzx, r0.zzzz
					mul r0.zw, r1.xxxy, r3.yyyy
					mad r0.zw, r2.xxxy, r3.xxxx, r0.zzzw
					mad r0.xy, r0.xyxx, r3.zzzz, r0.zwzz
					mad r0.xy, cb1[0].xxxx, cb0[3].zwzz, r0.xyxx
					add r1.xyzw, r0.xyxy, v4.xzzy
					add r0.xy, r0.xyxx, v4.xyxx
					sample r0.xyzw, r0.xyxx, t0.xyzw, s0
					sample r2.xyzw, r1.xyxx, t0.xyzw, s0
					sample r1.xyzw, r1.zwzz, t0.xyzw, s0
					mul r0.zw, r3.yyyy, r2.xxxy
					mad r0.zw, r1.xxxy, r3.xxxx, r0.zzzw
					mad r0.xy, r0.xyxx, r3.zzzz, r0.zwzz
					add r0.z, -cb0[4].y, cb0[4].x
					ge r0.z, r0.z, r0.x
					movc r0.z, r0.z, l(-1.000000), l(-0.000000)
					ge r0.x, cb0[4].x, r0.x
					and r0.x, r0.x, l(0x3f800000)
					add r0.x, r0.z, r0.x
					mul r0.x, r0.y, r0.x
					mul r0.xyzw, r0.xxxx, v1.xyzw
					mul r0.xyzw, r0.xyzw, cb0[2].xyzw
					mov_sat r0.w, r0.w
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
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float       
					// NORMAL                   0   xyz         3     NONE   float   xyz 
					// TEXCOORD                 1   xyz         4     NONE   float   xyz 
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[5], immediateIndexed
					dcl_constantbuffer CB1[1], immediateIndexed
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v3.xyz
					dcl_input_ps linear v4.xyz
					dcl_output o0.xyzw
					dcl_temps 4
					mad r0.xy, cb1[0].xxxx, cb0[3].xyxx, v4.xyxx
					sample r0.xyzw, r0.xyxx, t0.xyzw, s0
					mad r1.xyzw, cb1[0].xxxx, cb0[3].xyxy, v4.xzzy
					sample r2.xyzw, r1.zwzz, t0.xyzw, s0
					sample r1.xyzw, r1.xyxx, t0.xyzw, s0
					add r0.z, v3.y, v3.x
					add r0.z, r0.z, v3.z
					div r3.xyz, v3.xyzx, r0.zzzz
					mul r0.zw, r1.xxxy, r3.yyyy
					mad r0.zw, r2.xxxy, r3.xxxx, r0.zzzw
					mad r0.xy, r0.xyxx, r3.zzzz, r0.zwzz
					mad r0.xy, cb1[0].xxxx, cb0[3].zwzz, r0.xyxx
					add r1.xyzw, r0.xyxy, v4.xzzy
					add r0.xy, r0.xyxx, v4.xyxx
					sample r0.xyzw, r0.xyxx, t0.xyzw, s0
					sample r2.xyzw, r1.xyxx, t0.xyzw, s0
					sample r1.xyzw, r1.zwzz, t0.xyzw, s0
					mul r0.zw, r3.yyyy, r2.xxxy
					mad r0.zw, r1.xxxy, r3.xxxx, r0.zzzw
					mad r0.xy, r0.xyxx, r3.zzzz, r0.zwzz
					log r0.xy, r0.xyxx
					mul r0.xy, r0.xyxx, l(0.450000, 0.450000, 0.000000, 0.000000)
					exp r0.xy, r0.xyxx
					add r0.z, -cb0[4].y, cb0[4].x
					ge r0.z, r0.z, r0.x
					movc r0.z, r0.z, l(-1.000000), l(-0.000000)
					ge r0.x, cb0[4].x, r0.x
					and r0.x, r0.x, l(0x3f800000)
					add r0.x, r0.z, r0.x
					mul r0.x, r0.y, r0.x
					mul r0.xyzw, r0.xxxx, v1.xyzw
					mul r0.xyzw, r0.xyzw, cb0[2].xyzw
					mov_sat r0.w, r0.w
					mul o0.xyzw, r0.xyzw, cb0[2].wwww
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}