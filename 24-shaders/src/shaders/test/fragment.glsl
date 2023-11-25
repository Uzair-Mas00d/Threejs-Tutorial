
// precision mediump float; These thing are only works with RawShaderMaterial But in ShaderMaterial They already predefine

uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUV;
varying float vElevation;
// varying float vRandom;

void main(){
    vec4 textureColor = texture2D(uTexture,vUV);
    textureColor.rgb *= vElevation * 2.0 + 0.5;
    gl_FragColor = textureColor;

    gl_FragColor = vec4(vUV, 1.0, 1.0);
}