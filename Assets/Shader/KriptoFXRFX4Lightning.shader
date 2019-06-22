Shader "KriptoFX/RFX4/Lightning" {
	Properties {
		[HDR] _TintColor ("Tint Color", Vector) = (0.5,0.5,0.5,0.5)
		_MainTex ("Main Texture", 2D) = "white" {}
		_DistortTex1 ("Distort Texture1", 2D) = "white" {}
		_DistortTex2 ("Distort Texture2", 2D) = "white" {}
		_DistortSpeed ("Distort Speed Scale (xy/zw)", Vector) = (1,0.1,1,0.1)
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			Offset -1, -1
			GpuProgramID 34754
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
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float   xyzw
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[8], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_input v2.xy
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xyzw
					dcl_output o2.xy
					dcl_output o3.xyzw
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
					mad o2.xy, v2.xyxx, cb0[5].xyxx, cb0[5].zwzz
					mad o3.xy, v2.xyxx, cb0[6].xyxx, cb0[6].zwzz
					mad o3.zw, v2.xxxy, cb0[7].xxxy, cb0[7].zzzw
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
					// SV_POSITION              0   xyzw        0      POS   float       
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					// TEXCOORD                 0   xy          2     NONE   float   xy  
					// TEXCOORD                 1   xyzw        3     NONE   float   xyzw
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
					dcl_sampler s1, mode_default
					dcl_sampler s2, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_resource_texture2d (float,float,float,float) t1
					dcl_resource_texture2d (float,float,float,float) t2
					dcl_input_ps linear v1.xyzw
					dcl_input_ps linear v2.xy
					dcl_input_ps linear v3.xyzw
					dcl_output o0.xyzw
					dcl_temps 3
					mul r0.xyzw, cb0[4].xxzz, cb1[0].xxxx
					mad r0.xyzw, -r0.xyzw, l(1.400000, 1.400000, 1.250000, 1.250000), v3.xyzw
					add r0.xyzw, r0.xyzw, l(0.400000, 0.600000, 0.300000, 0.700000)
					sample r1.xyzw, r0.xyxx, t0.xyzw, s1
					sample r0.xyzw, r0.zwzz, t1.xyzw, s2
					mad r0.xy, r0.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					mad r0.zw, r1.xxxy, l(0.000000, 0.000000, 2.000000, 2.000000), l(0.000000, 0.000000, -1.000000, -1.000000)
					mad r1.xyzw, cb0[4].xxzz, cb1[0].xxxx, v3.xyzw
					sample r2.xyzw, r1.xyxx, t0.xyzw, s1
					sample r1.xyzw, r1.zwzz, t1.xyzw, s2
					mad r1.xy, r1.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					add r0.xy, r0.xyxx, r1.xyxx
					mad r1.xy, r2.xyxx, l(2.000000, 2.000000, 0.000000, 0.000000), l(-1.000000, -1.000000, 0.000000, 0.000000)
					add r0.zw, r0.zzzw, r1.xxxy
					mad r0.zw, r0.zzzw, cb0[4].yyyy, v2.xxxy
					mad r0.xy, r0.xyxx, cb0[4].wwww, r0.zwzz
					sample r0.xyzw, r0.xyxx, t2.xyzw, s0
					add r1.xyzw, v1.xyzw, v1.xyzw
					mul r1.xyzw, r1.xyzw, cb0[2].xyzw
					mul o0.xyzw, r0.xyzw, r1.xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}