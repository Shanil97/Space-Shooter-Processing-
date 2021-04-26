class Enemy{
  
  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;
  
  Enemy(){
    size = 25;
    loc = new PVector(random(size / 2, width - size / 2), -size / 2);
    vel = 3;
    coolingTime = int(random(60));
    isDead = false;
  }
  
  void display(){
    noFill();
    stroke(255, 0, 0);
    ellipse(loc.x, loc.y, size, size);
  }

  void update(){
    loc.y += vel;
    if(loc.y > height){
      isDead = true;
    }
    coolingTime++;
    if(coolingTime >= 60){
      eneBullets.add(new Bullet(this));
      coolingTime = 0;
    }
    for(Bullet b: myBullets){
      if((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
         && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)){
        isDead = true;
        b.isDead = true;
        score = score + 1;
        break;
      }
    }
  }    
}
