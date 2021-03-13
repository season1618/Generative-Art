import java.util.Deque;
import java.util.ArrayDeque;
class cherryblossom extends AppBase{
  cherryblossom(PApplet _parent) {
    super(_parent);
  }

  Turtle turtle;
  Deque<Data> stack;
  String str;
  int start;
  
  void setup(){
    size(600, 600);
    background(#A0A0A0);
    turtle = new Turtle(width/2, 570, 275);
    stack = new ArrayDeque<Data>();
    str = "X";
  
    for(int i = 0; i < 6; i++){
      //str = str.replaceAll("F", "F[]F");
      //str = str.replaceAll("X", "]F[[-[]*[]+[]F[]F[]F[]X[]X[]X[");
      str = str.replaceAll("FF", "FFF");
      str = str.replaceAll("X", "FF[[-X]*FX]+FX");
    }print(str);
    frameRate(240);
    start = frameCount;
  }
  void draw(){
    int i = frameCount - start;
    if(i < str.length()){
      stroke(#000000);
      switch(str.charAt(i)){
        case 'F':
          turtle.forward(10);
          break;
        case '+':
          turtle.bold *= 0.8;
          turtle.turnRight(15);
          break;
        case '*':
          turtle.bold *= 0.8;
          turtle.turnLeft(10);
          break;
        case '-':
          turtle.bold *= 0.8;
          turtle.turnLeft(25);
          break;
        case '[':
          stack.push(turtle.getState());
          break;
        case ']': 
          turtle.setState(stack.pop());
          break;
      }
      if(turtle.bold < 2)if(random(10) < 8){
        fill(#FEEEED); noStroke();
        ellipse(turtle.x + random(-5, 5), turtle.y + random(-5, 5), 2, 2);
      }
    }else{
    }
  }
  
  class Data{
    float x, y, theta, bold;
    public Data(float x, float y, float theta, float bold){
      this.x = x;
      this.y = y;
      this.theta = theta;
      this.bold = bold;
    }
  }
  class Turtle{
    float x, y, theta = 270, bold = 4;
    float speed;
    Turtle(float x, float y, float theta){
      this.x = x;
      this.y = y;
      this.theta = theta;
    }
    Turtle(float x, float y){
      this.x = x;
      this.y = y;
    }
    void setState(float x, float y, float theta){
      this.x = x;
      this.y = y;
      this.theta = theta;
    }
    void setState(Data state){
      this.x = state.x;
      this.y = state.y;
      this.theta = state.theta;
      this.bold = state.bold;
    }
    Data getState(){
      return new Data(x, y, theta, bold);
    }
    void forward(float distance){
      float x_next = x + distance * cos(radians(theta));
      float y_next = y + distance * sin(radians(theta));
      strokeWeight(bold);
      line(x, y, x_next, y_next);
      x = x_next;
      y = y_next;
    }
    void back(float distance){
      float x_next = x - distance * cos(radians(theta));
      float y_next = y - distance * sin(radians(theta));
      strokeWeight(bold);
      line(x, y, x_next, y_next);
      x = x_next;
      y = y_next;
    }
    void turnRight(float theta){
      this.theta += theta;
    }
    void turnLeft(float theta){
      this.theta -= theta;
    }
  }
}
