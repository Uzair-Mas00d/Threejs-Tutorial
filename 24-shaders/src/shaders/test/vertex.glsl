
// uniform mat4 projectionMatrix; These thing are only works with RawShaderMaterial
// uniform mat4 viewMatrix;         But in ShaderMaterial They already predefine
// uniform mat4 modelMatrix;
// attribute vec3 position;
// attribute vec2 uv;

uniform vec2 uFrequency;
uniform float uTime;

attribute float aRandom;

varying vec2 vUV;
varying float vElevation;
// varying float vRandom;

void main(){
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1; 
    modelPosition.z += elevation;
    // modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0); you can also write like this

    vUV = uv;
    vElevation = elevation;
    // vRandom = aRandom;
}