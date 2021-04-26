
class Player{
 PVector loc;
 float size;
 float speedX;
 int coolingTime;
  boolean isDead;
 
 Player(){
  size = 25;
  loc = new PVector(width / 2, height - size / 2 - 10);
  coolingTime = 0;
  isDead = false;
 }
 
 void display(){
 if(isDead){
    fill(255, 255, 0);
    stroke(0, 255, 0); 
  } else {
    noFill();
    stroke(0, 255, 0);
  }
  rect(loc.x, loc.y, size, size);
 }
 
 void move(){
   isDead = false;
   loc.x += speedX;
   coolingTime++;

   if(mousePressed && coolingTime >= 10){
      myBullets.add(new Bullet());
      coolingTime = 0;
    }
    for(Bullet b: eneBullets){
      if((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
         && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)){
        isDead = true;
        b.isDead = true;
        lives = lives - 1;
        break;
      }
    }
    for(Enemy e: enemies){
      if(abs(loc.x - e.loc.x) < size / 2 + e.size / 2 && abs(loc.y - e.loc.y) < size / 2 + e.size / 2){
        isDead = true;
        e.isDead = true;
        break;
      }
    }
   
  }  
  
}
