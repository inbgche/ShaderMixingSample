//Multi-Pass Shader Test. Rapapa.net
 
Shader "Test/FV_FV" {
    Properties {
    } 
 
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
      //Vertex-Fragment Functionality shader - GREEN          //
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
          return fixed4(i.color.r, 1, 0, 1);
        }
 
        ENDCG
 
      }
  }
 
  Fallback "Diffuse"
}
 