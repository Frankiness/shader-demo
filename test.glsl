precision mediump int;
precision mediump float;

uniform vec2 u_resolution; // 画布尺寸（宽，高）
uniform vec2 u_mouse; // 鼠标位置（在屏幕上哪个像素）
uniform float u_time; // 时间（加载后的秒数）

// 画圆
float circle(vec2 st, vec2 center, float radius) {
  float blur = 0.002; //模糊度，抗锯齿
  
  float pct = distance(st, center); //计算任意点到圆心的距离
  
  // vec2 tC = st - center; //计算圆心到任意点的向量
  // float pct = length(tC);//使用length函数求出长度
  // float pct = sqrt(tC.x * tC.x + tC.y * tC.y); //使用开平方的方法求出长度
  
  return 1.0 - smoothstep(radius, radius + blur, pct);
}

// 旋转矩阵
mat2 scale(vec2 _scale) {
  return mat2(_scale.x, 0.0,
  0.0, _scale.y);
}

void main() {
  vec2 st = gl_FragCoord.xy / u_resolution.xy;
  vec3 color = vec3(0.0);
  
  // To move the cross we move the space
  vec2 translate = vec2(cos(u_time), sin(u_time));
  // st += translate * 0.15;
  st = scale(vec2(sin(u_time) + 1.0)) * st;
  
  // Show the coordinates of the space on the background
  //color = vec3(st.x, st.y, 0.0);
  
  // Add the shape on the foreground
  color += vec3(circle(st, vec2(0.5), 0.1));
  
  gl_FragColor = vec4(color, 1.0);
}