//Multi-Pass Shader Test. Rapapa.net
 
Shader "Test/F_S" {
Properties {}
 
  SubShader {
    Tags {"Queue" = "Geometry" "RenderType" = "Opaque" }
 
    ////////////////////////////////////////////////////////
    //Fixed Functionality shader - RED                    //
    ////////////////////////////////////////////////////////
    Pass
    {
      Color (1, 0, 0, 1)
    }
 
 
    ////////////////////////////////////////////////////////
    //Surface Shader  - GREEN                             //
    ////////////////////////////////////////////////////////
    CGPROGRAM
 
    #pragma target 3.0
    #pragma surface surf BlinnPhong
 
    struct Input {
      float4 color : COLOR;
    };
 
    void surf (Input IN, inout SurfaceOutput o) {
      o.Albedo = float3(0, 1, 0);
    }
 
    ENDCG
  }
 
   Fallback "Diffuse"
}
 