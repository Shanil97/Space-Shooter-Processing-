class Bullet{
  
  PVector loc;
  float vel;
  boolean isMine;
  boolean isDead;
  
  Bullet(){
    loc = new PVector(player.loc.x, player.loc.y);
    vel = -10;
    isMine = true;
  }
  
  Bullet(Enemy enemy){
    loc = new PVector(enemy.loc.x, enemy.loc.y);
    vel = 5;
    isMine = false;
  }
  
  void display(){
    if(isMine){
      stroke(0, 255, 0);
    } else {
      stroke(255, 0, 0);    
    }
    line(loc.x, loc.y, loc.x, loc.y + vel);    
  }

  void update(){
    loc.y += vel;
    if((vel > 0 && loc.y > height) || (vel < 0 && loc.y < 0)){
      isDead = true;
    }
  }  
}
