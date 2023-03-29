Shader "Custom/VertexExtrusionWBump"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _Amount("Extrude", Range(0, 0.5)) = 0

            _myBump("Bump Texture", 2D) = "bump" {}
             _mySlider("Bump Amount", Range(0,10)) = 1
    }
        SubShader
             {
                 Tags { "RenderType" = "Opaque" }
            LOD 200
                 CGPROGRAM
                 #pragma surface surf Lambert vertex:vert

                 struct Input
                 {
                     float2 uv_MainTex;
                     float2 uv_myBump;
                 };

                 struct appdata
                 {
                     float4 vertex: POSITION;
                     float3 normal: NORMAL;
                     float4 texcoord: TEXCOORD0;
                     float4 tangent: TANGENT;
                 };

                 float _Amount;

                 void vert(inout appdata v)
                 {
                     v.vertex.xyz += v.normal * _Amount;
                 }

                 sampler2D _Maintex;

                 sampler2D _myBump;
                 half _mySlider;

                 void surf(Input IN, inout SurfaceOutput o)
                 {
                     o.Albedo = tex2D(_Maintex, IN.uv_MainTex).rgb;
                     o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
                     o.Normal *= float3(_mySlider, _mySlider, 1);
                 }
                 ENDCG
             }
                 FallBack "Diffuse"
}