
final static float VEL = 5; //velocity 

int score = 0;
int lives = 5;
boolean lost=false;  

Player player;

ArrayList<Enemy> enemies;
ArrayList<Bullet> myBullets;
ArrayList<Bullet> eneBullets;

void setup(){
  size(640, 640);
  frameRate(60);
  rectMode(CENTER);
  player = new Player();
  enemies = new ArrayList<Enemy>();
  myBullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>();
  
}

void draw(){
 background(0); 
 stroke(225);
 
 textSize(15);
 fill(0, 225, 0);
 text("score = "+score,20,20);                  //Print the score on the screen
 text("lives = "+lives,width-80,20);
  
 fill(225);
 for (int i=1; i<20 ;i++){
   ellipse(random(640), random(640), 3, 3);
 }
 
  if (lives<=0)                                 
  {
    textSize(20);
    text("You are Dead!", 250,height/2);
    text("Score = "+score, 270,height/2+ 30);
    text("Press Enter to Restart",215, height/2+ 60);
    noLoop();                                            //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
  }
 
  player.display();
   player.display();
  for(Enemy enemy: enemies){
    enemy.display();
  }
  for(Bullet bullet: myBullets){
    bullet.display();
  }
  for(Bullet bullet: eneBullets){
    bullet.display();
  }
  
  player.move(); 
  
  ArrayList<Enemy> nextEnemies = new ArrayList<Enemy>();
  for(Enemy enemy: enemies){
    enemy.update();
    if(!enemy.isDead){
      nextEnemies.add(enemy);
    }
  }
  enemies = nextEnemies;
  ArrayList<Bullet> nextMyBullets = new ArrayList<Bullet>();
  for(Bullet bullet: myBullets){
    bullet.update();
    if(!bullet.isDead){
      nextMyBullets.add(bullet);
    }
  }
  myBullets = nextMyBullets;
  ArrayList<Bullet> nextEneBullets = new ArrayList<Bullet>();
  for(Bullet bullet: eneBullets){
    bullet.update();
    if(!bullet.isDead){
      nextEneBullets.add(bullet);
    }
  }
  eneBullets = nextEneBullets;
  if(random(1) < 0.02){
    enemies.add(new Enemy());
  }
}
  
void keyPressed(){
  if(keyCode == RIGHT){ 
    player.speedX = VEL;
  }
  
  if(keyCode == LEFT){ 
    player.speedX = -VEL;
  }
  if(keyCode == ENTER){
    if(lost==true)                 
  {                            
    lives=5;
    score=0;
    lost=false;
    loop();                                     
  }
  }
}

void keyReleased(){
  if(keyCode == RIGHT){ 
    player.speedX = 0;
  }
  
  if(keyCode == LEFT){ 
    player.speedX = 0;
  }
  
}
