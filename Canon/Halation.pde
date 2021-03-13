class Halation extends AppBase{
  Halation(PApplet _parent) {
    super(_parent);
  }
  Planet planet;
  int start;
  void setup(){
    size(600, 600);
    background(0, 0, 0);
    stroke(#A0A0A0);
    strokeWeight(0.1);
    start = frameCount;
  }
  void draw(){
    int i = frameCount - start;
    if(i % 90 == 0) planet = new Planet(random(100, 500), random(100, 500));
    planet.update();
    line(width/2, height/2, planet.x, planet.y);
    if(i > 1250){
        for(int j = 0; j < 10; j++){
          float x = 400 * cos(radians(10*i+j)), y = 400 * sin(radians(10*i+j));
          line(width/2, height/2, x + width/2, y + height/2);
        }
    }
  }
  class Planet{
    float x, y; float vx, vy; float ax, ay;
    Planet(float x, float y){
      this.x = x;
      this.y = y;
      vx = (y - height/2) * 0.01;
      vy = (x - width/2) * 0.01;
      if(int(random(0, 2)) == 0) vx *= -1;
      else vy *= -1;
    }
    void update(){
      ax = - (x - width/2) / distance() * 2;
      ay = - (y - height/2) / distance() * 2;
      vx += ax; vy += ay;
      x += vx; y += vy;
    }
    float distance(){
      return (x-width/2)*(x-width/2) + (y-height/2)*(y-height/2);
    }
  }
}
