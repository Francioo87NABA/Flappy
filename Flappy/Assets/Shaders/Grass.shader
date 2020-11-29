// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Grass"
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
		_PlayerPosition("PlayerPosition", Vector) = (0,0,0,0)
		_PlayerRadius("PlayerRadius", Float) = 1
		_PlayerPushStrenght("PlayerPushStrenght", Float) = 0
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
		uniform float _PlayerPushStrenght;
		uniform float3 _PlayerPosition;
		uniform float _PlayerRadius;
		uniform float4 _MainColor;
		uniform float _Metallic;
		uniform float _Smothness;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float temp_output_17_0 = saturate( ( ase_worldPos.y * _HeighMask ) );
			float temp_output_18_0 = ( temp_output_17_0 * temp_output_17_0 );
			float mulTime31 = _Time.y * _NoiseSpeed;
			float2 appendResult30 = (float2(_GrassNoiseSpeed , 0.0));
			float2 appendResult24 = (float2(ase_worldPos.z , ase_worldPos.x));
			float2 panner27 = ( mulTime31 * appendResult30 + ( appendResult24 * _NoiseScale ));
			float4 appendResult11 = (float4(0.0 , 0.0 , ( sin( ( _Time.y + ( _WindVariation * ase_worldPos.z ) ) ) * _WindStrength * temp_output_18_0 * tex2Dlod( _TextureSample0, float4( panner27, 0, 0.0) ).r ) , 0.0));
			float temp_output_43_0 = ( 1.0 - saturate( ( distance( ase_worldPos , _PlayerPosition ) / _PlayerRadius ) ) );
			float4 lerpResult49 = lerp( appendResult11 , float4( ( ( _PlayerPushStrenght * ( ase_worldPos - _PlayerPosition ) ) * temp_output_43_0 * float3(1,0,1) * temp_output_18_0 ) , 0.0 ) , temp_output_43_0);
			v.vertex.xyz += lerpResult49.xyz;
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
1920;104;1366;747;3402.355;195.1973;3.632547;True;False
Node;AmplifyShaderEditor.CommentaryNode;42;-1846.399,240.1124;Inherit;False;1696.214;987.6489;Grass Wind;25;23;15;24;13;33;34;8;20;28;30;31;16;21;7;32;19;17;27;5;22;12;18;14;11;47;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;50;-1064.487,1033.425;Inherit;False;1519.028;698.469;Player Interaction;12;35;36;38;40;37;48;46;44;49;39;41;43;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldPosInputsNode;23;-1796.399,692.0985;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;35;-1014.486,1206.606;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;13;-1307.278,702.4086;Inherit;False;Property;_HeighMask;HeighMask;4;0;Create;True;0;0;False;0;False;10.08;0.73;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-1522.243,975.3015;Inherit;False;Property;_GrassNoiseSpeed;GrassNoiseSpeed;7;0;Create;True;0;0;False;0;False;0.1;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;-1561.289,715.4986;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector3Node;36;-1013.174,1400.031;Inherit;False;Property;_PlayerPosition;PlayerPosition;10;0;Create;True;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;33;-1585.006,864.1744;Inherit;False;Property;_NoiseScale;NoiseScale;8;0;Create;True;0;0;False;0;False;1;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;15;-1348.046,530.3099;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;34;-1580.381,1111.761;Inherit;False;Property;_NoiseSpeed;NoiseSpeed;9;0;Create;True;0;0;False;0;False;1;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1384.594,428.4493;Inherit;False;Property;_WindVariation;WindVariation;5;0;Create;True;0;0;False;0;False;4;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-1385.827,332.9203;Inherit;False;Constant;_WinSpeed;WinSpeed;3;0;Create;True;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;38;-749.5657,1380.288;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-773.5657,1507.286;Inherit;False;Property;_PlayerRadius;PlayerRadius;11;0;Create;True;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;31;-1350.364,1116.267;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1316.816,846.0172;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-1118.396,433.1507;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;7;-1179.966,338.8066;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;30;-1318.216,980.2467;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-1061.381,578.9407;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-920.569,338.8104;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;17;-884.5809,578.9406;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;39;-572.0714,1380.288;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;27;-1056.518,844.9952;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;41;-437.4649,1380.583;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-821.678,1083.424;Inherit;False;Property;_PlayerPushStrenght;PlayerPushStrenght;12;0;Create;True;0;0;False;0;False;0;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;37;-749.9449,1205.928;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-709.329,579.0055;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;5;-692.7192,337.8515;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;22;-836.5673,815.7527;Inherit;True;Property;_TextureSample0;Texture Sample 0;6;0;Create;True;0;0;False;0;False;-1;e61e481012baa7049a167e20b4ef71a5;e61e481012baa7049a167e20b4ef71a5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-739.2309,437.7529;Inherit;False;Property;_WindStrength;WindStrength;3;0;Create;True;0;0;False;0;False;0.02;6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-470.1315,337.6526;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-470.6789,1203.475;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;46;-243.7634,1543.888;Inherit;False;Constant;_Vector0;Vector 0;12;0;Create;True;0;0;False;0;False;1,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.OneMinusNode;43;-291.9115,1380.495;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-17.45367,1204.942;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;11;-311.1851,290.1124;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;49;272.5424,1330.846;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;3;463.5553,827.803;Inherit;False;Property;_Metallic;Metallic;1;0;Create;True;0;0;False;0;False;0;0.05;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;461.5553,928.8027;Inherit;False;Property;_Smothness;Smothness;2;0;Create;True;0;0;False;0;False;0;0.47;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1;514.6033,1037.252;Inherit;False;Property;_MainColor;MainColor;0;0;Create;True;0;0;False;0;False;0.4572012,1,0.2311321,1;0.2266933,0.4716981,0.0511748,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;949.6055,1043.753;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Grass;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;24;0;23;3
WireConnection;24;1;23;1
WireConnection;38;0;35;0
WireConnection;38;1;36;0
WireConnection;31;0;34;0
WireConnection;32;0;24;0
WireConnection;32;1;33;0
WireConnection;21;0;20;0
WireConnection;21;1;15;3
WireConnection;7;0;8;0
WireConnection;30;0;28;0
WireConnection;16;0;15;2
WireConnection;16;1;13;0
WireConnection;19;0;7;0
WireConnection;19;1;21;0
WireConnection;17;0;16;0
WireConnection;39;0;38;0
WireConnection;39;1;40;0
WireConnection;27;0;32;0
WireConnection;27;2;30;0
WireConnection;27;1;31;0
WireConnection;41;0;39;0
WireConnection;37;0;35;0
WireConnection;37;1;36;0
WireConnection;18;0;17;0
WireConnection;18;1;17;0
WireConnection;5;0;19;0
WireConnection;22;1;27;0
WireConnection;14;0;5;0
WireConnection;14;1;12;0
WireConnection;14;2;18;0
WireConnection;14;3;22;1
WireConnection;48;0;47;0
WireConnection;48;1;37;0
WireConnection;43;0;41;0
WireConnection;44;0;48;0
WireConnection;44;1;43;0
WireConnection;44;2;46;0
WireConnection;44;3;18;0
WireConnection;11;2;14;0
WireConnection;49;0;11;0
WireConnection;49;1;44;0
WireConnection;49;2;43;0
WireConnection;0;0;1;0
WireConnection;0;3;3;0
WireConnection;0;4;2;0
WireConnection;0;11;49;0
ASEEND*/
//CHKSM=1B6EC6CBCA6DC8F92327022539ED9AF3330656D4