Oscillator square[][] = new Oscillator[2][2];
int dir_x[] = {0, 1, 1, 0};
int dir_y[] = {0, 0, 1, 1};
int id[][] = {{0, 1}, {3, 2}};
int cnt = 0;
void setup(){
  size(600, 400);
  for(int i = 0; i < 2; i++){
    for(int j = 0; j < 2; j++){
      int num = id[i][j];
      square[i][j] = new Oscillator(60*dir_x[num] + 100, 60*dir_y[num] + 100);
    }
  }
}
void draw(){
  background(#000000);
  for(int i = 0; i < 2; i++){
    for(int j = 0; j < 2; j++){
      if(i == 0 && j == 0) continue;
      int num = (cnt + id[i][j]) % 4;
      square[i][j].transport(
        60*dir_x[num]+100, 60*dir_y[num]+100,
        60*dir_x[(num+1)%4]+100, 60*dir_y[(num+1)%4]+100
      );
      rect(square[i][j].x, square[i][j].y, 30, 30);
    }
  }
  //if(frameCount % 60 == 0) cnt++;
}
class Oscillator{
  float x, y; float vx = 0, vy = 0; float ax, ay;
  float k = 0.05;
  Oscillator(float x, float y){
    this.x = x; this.y = y;
  }
  void transport(float sx, float sy, float gx, float gy){
    float mx = (sx + gx) / 2;
    float my = (sy + gy) / 2;
    ax = - k * (x - mx); ay = - k * (y - my);
    vx += ax; vy += ay;
    x += vx; y += vy;
    return;
  }
}
