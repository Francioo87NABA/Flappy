// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FakeGrass"
{
	Properties
	{
		_MainColor("MainColor", Color) = (0.4572012,1,0.2311321,1)
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Smothness("Smothness", Range( 0 , 1)) = 0
		_WindStrength("WindStrength", Float) = 0.02
		_HeighMask("HeighMask", Float) = 10.08
		_WindVariation("WindVariation", Float) = 4
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_GrassNoiseSpeed("GrassNoiseSpeed", Float) = 0.1
		_NoiseScale("NoiseScale", Float) = 1
		_NoiseSpeed("NoiseSpeed", Float) = 1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
		};

		uniform float _WindVariation;
		uniform float _WindStrength;
		uniform float _HeighMask;
		uniform sampler2D _TextureSample0;
		SamplerState sampler_TextureSample0;
		uniform float _NoiseSpeed;
		uniform float _GrassNoiseSpeed;
		uniform float _NoiseScale;
		uniform float4 _MainColor;
		uniform float _Metallic;
		uniform float _Smothness;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float temp_output_18_0 = saturate( ( ase_worldPos.y * _HeighMask ) );
			float mulTime3 = _Time.y * _NoiseSpeed;
			float2 appendResult15 = (float2(_GrassNoiseSpeed , 0.0));
			float2 appendResult7 = (float2(ase_worldPos.z , ase_worldPos.x));
			float2 panner19 = ( mulTime3 * appendResult15 + ( appendResult7 * _NoiseScale ));
			float4 appendResult25 = (float4(0.0 , 0.0 , ( sin( ( _Time.y + ( _WindVariation * ase_worldPos.z ) ) ) * _WindStrength * ( temp_output_18_0 * temp_output_18_0 ) * tex2Dlod( _TextureSample0, float4( panner19, 0, 0.0) ).r ) , 0.0));
			v.vertex.xyz += appendResult25.xyz;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _MainColor.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Smothness;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18703
1920;110;1366;741;2757.3;477.9401;2.137948;True;False
Node;AmplifyShaderEditor.CommentaryNode;1;-2006.711,-84.53859;Inherit;False;1696.214;987.6489;Grass Wind;24;25;24;23;22;21;20;19;18;17;16;15;14;13;12;11;10;9;8;7;6;5;4;3;2;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldPosInputsNode;4;-1956.711,367.4477;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;2;-1740.693,787.1103;Inherit;False;Property;_NoiseSpeed;NoiseSpeed;9;0;Create;True;0;0;False;0;False;1;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-1467.59,377.7578;Inherit;False;Property;_HeighMask;HeighMask;4;0;Create;True;0;0;False;0;False;10.08;0.73;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-1682.555,650.6508;Inherit;False;Property;_GrassNoiseSpeed;GrassNoiseSpeed;7;0;Create;True;0;0;False;0;False;0.1;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;7;-1721.601,390.8478;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-1745.318,539.5236;Inherit;False;Property;_NoiseScale;NoiseScale;8;0;Create;True;0;0;False;0;False;1;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;9;-1508.358,205.6589;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;10;-1544.906,103.7984;Inherit;False;Property;_WindVariation;WindVariation;5;0;Create;True;0;0;False;0;False;4;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1546.139,8.269277;Inherit;False;Constant;_WinSpeed;WinSpeed;3;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;15;-1478.528,655.5959;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;14;-1340.278,14.1556;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-1221.693,254.2897;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-1477.128,521.3665;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-1278.708,108.4997;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;3;-1510.676,791.6163;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;17;-1080.881,14.15939;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;18;-1044.893,254.2896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;19;-1216.83,520.3444;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-869.6418,254.3545;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;21;-853.032,13.20049;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;22;-996.8802,491.1019;Inherit;True;Property;_TextureSample0;Texture Sample 0;6;0;Create;True;0;0;False;0;False;-1;e61e481012baa7049a167e20b4ef71a5;e61e481012baa7049a167e20b4ef71a5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-899.5438,113.102;Inherit;False;Property;_WindStrength;WindStrength;3;0;Create;True;0;0;False;0;False;0.02;6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-630.4443,13.00158;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-613.3981,-533.1229;Inherit;False;Property;_Metallic;Metallic;1;0;Create;True;0;0;False;0;False;0;0.05;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;28;-562.3501,-323.6743;Inherit;False;Property;_MainColor;MainColor;0;0;Create;True;0;0;False;0;False;0.4572012,1,0.2311321,1;0.2266933,0.4716981,0.0511748,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;27;-615.3981,-432.1236;Inherit;False;Property;_Smothness;Smothness;2;0;Create;True;0;0;False;0;False;0;0.47;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;25;-471.4979,-34.53862;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-213,-322;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;FakeGrass;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;4;3
WireConnection;7;1;4;1
WireConnection;15;0;6;0
WireConnection;14;0;11;0
WireConnection;16;0;9;2
WireConnection;16;1;5;0
WireConnection;12;0;7;0
WireConnection;12;1;8;0
WireConnection;13;0;10;0
WireConnection;13;1;9;3
WireConnection;3;0;2;0
WireConnection;17;0;14;0
WireConnection;17;1;13;0
WireConnection;18;0;16;0
WireConnection;19;0;12;0
WireConnection;19;2;15;0
WireConnection;19;1;3;0
WireConnection;20;0;18;0
WireConnection;20;1;18;0
WireConnection;21;0;17;0
WireConnection;22;1;19;0
WireConnection;24;0;21;0
WireConnection;24;1;23;0
WireConnection;24;2;20;0
WireConnection;24;3;22;1
WireConnection;25;2;24;0
WireConnection;0;0;28;0
WireConnection;0;3;26;0
WireConnection;0;4;27;0
WireConnection;0;11;25;0
ASEEND*/
//CHKSM=5853EDEEC900FF4A742BAAF35E3BDA2F803B4120