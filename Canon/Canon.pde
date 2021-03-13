import ddf.minim.*;
Minim minim;
AudioPlayer player;
ArrayList<AppBase>apps;
void setup(){
  size(600,600);
  minim = new Minim(this);
  player = minim.loadFile("Pachelbel-Cannon.mp3");
  player.play();
  
  apps = new ArrayList<AppBase>();
  apps.add(new Ripples(this));
  apps.add(new Halation(this));
  apps.add(new cherryblossom(this));
}
void draw() {
  if(frameCount == 1) apps.get(0).setup();
  else if(frameCount == 650) apps.get(1).setup();
  else if(frameCount == 1950) apps.get(2).setup();

  if(frameCount < 650) apps.get(0).draw();
  else if(frameCount < 1950) apps.get(1).draw();
  else apps.get(2).draw();
}
void stop(){
  player.close();
  minim.stop();
  super.stop();
}
