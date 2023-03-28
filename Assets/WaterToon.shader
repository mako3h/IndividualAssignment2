Shader "Custom/WaterToon"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _Tint("Colour Tint", Color) = (1,1,1,1)
        _Freq("Frequency", Range(0,5)) = 3
        _Speed("Speed", Range(0,100)) = 100
        _Amp("Amplitude", Range(0,1)) = 0.5
        _Color("Color", Color) = (1,1,1,1)
        _RampTex("Ramp Texture", 2D) = "white" {}
    }

        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 100

        CGPROGRAM
        #pragma surface surf WaterToon

        struct SurfaceOutputStandard
        {
            float3 Albedo;
            float3 Normal;
            float3 Emission;
            float Metallic;
            float Smoothness;
            float Occlusion;
            float Alpha;
        };

        sampler2D _MainTex;
        float4 _Tint;
        float _Freq;
        float _Speed;
        float _Amp;
        float4 _Color;
        sampler2D _RampTex;

        struct appdata
        {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
            float4 texcoord : TEXCOORD0;
        };

        void vert(inout appdata v, out Input o)
        {
            UNITY_INITIALIZE_OUTPUT(Input, o);
            float t = _Time * _Speed;
            float waveHeight = sign(sin(t + v.vertex.x * _Freq)) * _Amp + sign(sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp);
            v.vertex.y = v.vertex.y + waveHeight;
            v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
        }

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            float4 c = tex2D(_MainTex, IN.texcoord.xy) * _Tint;
            o.Albedo = c.rgb;
            o.Alpha = c.a;
            o.Normal = UnpackNormal(tex2D(_MainTex, IN.texcoord.xy + _Time.xy * _Speed).rgb * 2 - 1);
            o.Metallic = 0;
            o.Smoothness = 0.5;
            o.Occlusion = 1;
            o.Emission = _Color.rgb * tex2D(_RampTex, float2(dot(IN.normal, float3(0, 0, 1)), 0)).r;
        }
        ENDCG
    }

        FallBack "Diffuse"
}