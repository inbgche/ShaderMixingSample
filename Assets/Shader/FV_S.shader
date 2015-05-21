//Multi-Pass Shader Test. Rapapa.net
 
Shader "Test/FV_S" {
  Properties {}
 
  SubShader {
    Tags {"Queue" = "Geometry" "RenderType" = "Opaque" }
 
    ////////////////////////////////////////////////////////
    //Vertex-Fragment Functionality shader - RED          //
    ////////////////////////////////////////////////////////
 
    Pass {
 
      CGPROGRAM
      #pragma vertex vert
      #pragma fragment frag
 
      struct vertexInput
      {
        float4 vertex : POSITION;
        float4 color : COLOR;
      };
 
      struct vertexOutput
      {
        float4 pos : POSITION;
        float4 color : COLOR;
        };
 
      vertexOutput vert(vertexInput v) {
        vertexOutput o;
        o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
        o.color = v.color;
        return o;
      }
 
      fixed4 frag( vertexOutput i) : COLOR {
        return fixed4(1, 0, 0, 1);
      }
 
      ENDCG
    }
 
    ////////////////////////////////////////////////////////
    //Surface Shader  - BLUE                              //
    ////////////////////////////////////////////////////////
 
    CGPROGRAM
    #pragma target 3.0
    #pragma surface surf BlinnPhong
 
    struct Input {
      float4 color : COLOR;
    };
 
    void surf (Input IN, inout SurfaceOutput o) {
      o.Albedo = float3(IN.color.r, 0, 1);
    }
 
    ENDCG
  }
 
  Fallback "Diffuse"
}
 