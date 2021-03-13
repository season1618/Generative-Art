class Ripples extends AppBase{
  Ripples(PApplet _parent) {
    super(_parent);
  }
  wave[] wave_array;
  void setup(){
    size(600, 600);
    wave_array = new wave[30];
    //wave_array[0] = new wave(400, 400, 0);
    //wave_array[1] = new wave(200, 300, 20);
    //wave_array[2] = new wave(250, 100, 40);
    for(int i = 0; i < 30; i++){
      wave_array[i] = new wave(random(100,500), random(100,500), 70*i);
    }
  }
  void draw(){
    background(0, 0, 0);
    for(int i = 0; i < 30; i++){
      wave_array[i].update();
    }
  }
  class wave{
    float x, y; float r;
    float limit = random(100, 500);
    wave(float x, float y, int t){
      this.x = x; this.y = y;
      r = -t;
    }
    void update(){
      noFill();
      colorMode(RGB, limit);
      stroke(200, 200, 200);
      r += 4;
      if(r >= 0 && r < limit){ stroke(limit-r, limit-r, limit-r); ellipse(x, y, r, r); }
      if(0.7*r >= 0 && 0.7*r < limit) ellipse(x, y, 0.7*r, 0.7*r);
      if(0.6*r >= 0 && 0.6*r < limit) ellipse(x, y, 0.6*r, 0.6*r);
    }
  }
}
