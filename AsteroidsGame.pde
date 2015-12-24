//your variable declarations here
Stars [] yellow = new Stars[200];
SpaceShip tri;
Fire boom;
ArrayList<Asteroid> a;
ArrayList<bullet> clips; 
public void setup() 
{
  size(800,800);
  tri = new SpaceShip();
  for(int i = 0; i < yellow.length; i++)
  {
    yellow[i]= new Stars();
  }
  boom = new Fire();
  a = new ArrayList <Asteroid>();
  for(int i = 0; i < 10; i++){
    a.add(new Asteroid());
  }
  clips = new ArrayList <bullet>();
}
public void draw() 
{
  //your code here
  background(100,100,100);
  stroke(255);
  tri.show();
  tri.move();
  boom.move();
  for(int i = 0; i < yellow.length; i++)
  {
    yellow[i].show();
  } 
  for(int i = 0; i < a.size(); i++){
    a.get(i).show();
    a.get(i).move();
  }
  for(int b = 0; b< clips.size(); b++){
      clips.get(b).show();
      clips.get(b).move();
  }
  for(int i = 0; i < a.size(); i++){
    for(int b = 0; b< clips.size(); b++){
      double distance = dist(clips.get(b).getX(), clips.get(b).getY(), a.get(i).getX(), a.get(i).getY());
      if(distance < 15){
        clips.remove(a);
        a.remove(i);
        a.add(new Asteroid());
      }
    }
  }
}
public void keyPressed(){
  if(key == 'w'){tri.accelerate(0.4);boom.accelerate(0.4); stroke(255,0,0);boom.show();}
  if(key == 's'){tri.accelerate(-0.4);boom.accelerate(-0.4);}
  if(key == 'a'){tri.rotate(10);boom.rotate(10);}
  if(key == 'd'){tri.rotate(-10);boom.rotate(-10);}
  int RandX = (int)(Math.random()*800);
  int RandY = (int)(Math.random()*800);
  if(key == 'h'){tri.setX(RandX); tri.setY(RandY);boom.setX(RandX);boom.setY(RandY);tri.rotate(RandX);boom.rotate(RandX);tri.setDirectionX(0); boom.setDirectionX(0);tri.setDirectionY(0); boom.setDirectionY(0);}
}
public void mouseClicked(){
  for(int i = 0; i<1; i++){
    clips.add(new bullet(tri));
  }
}
class Stars
{
  private int myX,myY;
  public Stars()
  {
     myX = (int)(Math.random()*800);
     myY = (int)(Math.random()*800);
  }
  public void show()
  {
    fill(150,150,150);
    noStroke();
    ellipse(myX,myY,5,5);
  }
}

class SpaceShip extends Floater  
{ 
 private double dRadians;
 public SpaceShip(){
  corners = 3;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -8;
  yCorners[0] = -8;
  xCorners[1] = -8;
  yCorners[1] = 8;
  xCorners[2] = 16;
  yCorners[2] = 0;
  myCenterX = 400;
  myCenterY = 400;
  dRadians = atan2( mouseY - height/2, mouseX - width/2 );
  myPointDirection = atan2( mouseY - height/2, mouseX - width/2 );
 }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}  
  public double getDirectionX(){return myDirectionX;} 
  public void setDirectionY(double y){myDirectionY = y;}  
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
  public void show(){
    noFill(); 
    stroke(255);  
    strokeWeight(2);
    double dRadians = atan2( mouseY - tri.getY(), mouseX - tri.getX() );                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }
}
class Fire extends SpaceShip
{
  public Fire()
  {
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    yCorners[0] = -8;
    xCorners[1] = -10 + (int)(Math.random()*-8);
    yCorners[1] = -4;
    xCorners[2] = -10 + (int)(Math.random()*-8);
    yCorners[2] = 0;
    xCorners[3] = -10 + (int)(Math.random()*-8);
    yCorners[3] = 4;
    xCorners[4] = -10;
    yCorners[4] = 8;
    myCenterX = 400;
    myCenterY = 400;
  }
}
class Asteroid extends Floater  
{ 
 public Asteroid(){
  corners = 5;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -8;
  yCorners[0] = -8;
  xCorners[1] = -8;
  yCorners[1] = 8;
  xCorners[2] = 16;
  yCorners[2] = 0;
  xCorners[3] = 20;
  yCorners[3] = 20;
  xCorners[4] = -20;
  yCorners[4] = 10;
  myCenterX = (int)(Math.random()*800);
  myCenterY = (int)(Math.random()*800);
  myDirectionX = (int)((Math.random()*10)-5);
  myDirectionY = (int)((Math.random()*10)-5);
  myPointDirection = (double)((Math.random()*360));
 }
  
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}  
  public double getDirectionX(){return myDirectionX;} 
  public void setDirectionY(double y){myDirectionY = y;}  
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
}
class bullet extends Floater
{
  private double dRadians;
  public bullet(SpaceShip tri) 
  {
      myCenterX = tri.getX();
      myCenterY = tri.getY();
      myPointDirection = tri.getPointDirection();
      dRadians = atan2( mouseY - tri.getY(), mouseX - tri.getX() );
      myDirectionX = 5*Math.cos(dRadians) + tri.getDirectionX();
      myDirectionY = 5*Math.sin(dRadians) + tri.getDirectionY();
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}   
  public int getY(){return (int)myCenterY;}    
  public void setDirectionX(double x){myDirectionX = x;}      
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;} 
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
  public void show() {
    fill(255,0,0);
    noStroke();
    ellipse((float)myCenterX,(float)myCenterY,7,7);
  }
  public void move ()   {      
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =atan2( mouseY - tri.getY(), mouseX - tri.getX() );     
    //change coordinates of direction of travel   
    if(myDirectionX>=5.5){myDirectionX = 5.5;} 
    if(myDirectionY>=5.5){myDirectionY = 5.5;}
    if(myDirectionX<=-5.5){myDirectionX = -5.5;} 
    if(myDirectionY<=-5.5){myDirectionY = -5.5;}  
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    noFill(); 
    stroke(255);  
    strokeWeight(2);    
    //convert degrees to radians for sin and cos       
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

