//your variable declarations here
Stars [] yellow = new Stars[200];
SpaceShip tri;
public void setup() 
{
  size(800,800);
  tri = new SpaceShip();
  for(int i = 0; i < yellow.length; i++)
  {
    yellow[i]= new Stars();
  }
}
public void draw() 
{
  //your code here
  background(100,100,100);
  tri.show();
  tri.move();
  for(int i = 0; i < yellow.length; i++)
  {
    yellow[i].show();
  }
}
public void keyPressed(){
  if(key == 'w'){tri.accelerate(0.5);}
  if(key == 's'){tri.accelerate(-0.5);}
  if(key == 'a'){tri.rotate(5);}
  if(key == 'd'){tri.rotate(-5);}
  if(key == 'h'){tri.setX((int)(Math.random()*800)); tri.setY((int)(Math.random()*800));}
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
class Fire extends Spaceship
{
  public Fire()
  {
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = -8 + (Math.random()*-4);
    yCorners[1] = -4;
    xCorners[2] = 0;
    yCorners[2] = -8 + (Math.random()*-2);
    myCenterX = 400;
    myCenterY = 400;
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
    double dRadians =myPointDirection*(Math.PI/180);     
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
    strokeWeight(2);
    stroke(255);    
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

