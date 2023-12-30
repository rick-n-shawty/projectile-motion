Ball ball;
float GROUND = 400;
float angle = PI / 6; 
float V = 10; 
float Vx = V * cos(angle);
float Vy = -V * sin(angle);
float time = 0;
float g = 9.8; 
float pX = 0;
float pY = 0;
boolean isFired = false;
ArrayList<PVector> trail;
void setup(){
  background(255);
  size(900, 600);
  ball = new Ball(0,0,10);
  trail = new ArrayList();
}

void draw(){
  background(255);
  translate(50, GROUND);
  stroke(0);
  fill(0); 
  strokeWeight(1);
  //if(isFired){
  //  ball.x += Vx;
  //  ball.y += Vy;
  //}
  Vy += g * time;
  if(ball.y >= -1 && ball.x > 0){
    Vx = 0;
  }
  if(ball.y > 0){
    Vy = 0;
  }
  ball.x += Vx;
  ball.y += Vy;
  trail.add(new PVector(ball.x, ball.y));
  strokeWeight(2);
  for(int i = 0; i < trail.size(); i++){
    point(trail.get(i).x, trail.get(i).y);
  }
  circle(ball.x, ball.y - ball.r, ball.r);
  strokeWeight(ball.r); 
  line(-50, 0 , width, 0);
  time += 0.0005;
} 

void mousePressed(){
  isFired = true;
}
