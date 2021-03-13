class Butterflies extends AppBase{
  void setup(){
    size(600, 600);
    stroke(30, 150, 30);
  }
  void draw(){
    background(#FFFFFF);
    for(int i = 0; i < 600; i+=5){
      for(int j = 0; j < 600; j+=5){
        line(random(i, i+5), random(j, j+5), random(i, i+5), random(j+60, j+65));
      }
    }
  }
  class Butterfly{
    float theta = 90;
    void paint(float x, float y){
    }
  }
}
