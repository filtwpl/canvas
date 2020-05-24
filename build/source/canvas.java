import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class canvas extends PApplet {

// a drawing program

PImage rainbow;
public Button[] colors;
public Slider thicc;
public Button clear;
public int currentR = 0;
public int currentG = 0;
public int currentB = 0;
public int currentW = 3;
public int shapeMode = 0;

public void setup() {
  
  background(255);
  showSidebar();
  showBottombar();
}

public void draw() {
  //show buttons
  clear.show();
  showColors();
  thicc.show();
  rectangle();
  tri();
  star();
  point();
  //uwu
  textSize(20);
  fill(125, 142, 209);
  text("made for planet hacks 2020 by jm with processing <3", 425, 882);
  //checking shapeModes and drawing
  pen();
  //checking color switches
  palette();
  //checking brush size changes
  brushSize();
  //checking brush type changes
  brushType();
  //randomizer
  randomColor();
  //clear button
  checkClear();
}

//turn off clicky backgrounds
public void mouseReleased() {
  for (int i=0; i<colors.length; i++) {
    colors[i].setClicked(false);
  }
  clear.setClicked(false);
  rectBool = false;
  triBool = false;
  starBool = false;
  pointBool = false;
  rainBool = false;
}

public class Button {
  private int myIndex, myR, myG, myB, myPos;
  private boolean clicked;

  public Button(int index, int r, int g, int b) {
    myIndex = index;
    myR = r;
    myG = g;
    myB = b;
    myPos = 60*(myIndex+1);
    clicked = false;
  }

  public void show() {
    noStroke();
    if (clicked == true) {
      fill(255);
      rect(5, myPos-5, 40, 60, 6, 6, 6, 6);
    } else {
      fill(200);
      rect(5, myPos-5, 40, 60, 6, 6, 6, 6);
    }
    fill(myR, myG, myB);
    rect(10, myPos, 30, 50, 6, 6, 6, 6);
  }

  public int getPos() {return myPos;}
  public int getR() {return myR;}
  public int getG() {return myG;}
  public int getB() {return myB;}
  public void setClicked(boolean bool) {clicked = bool;}
}

public class Slider {
  private int myX, myY, myWidth, myHeight;
  private int valY = 0, value;

  public Slider(int x, int y, int w, int h) {
    myX = x;
    myY = y;
    myWidth = w;
    myHeight = h;
    valY = y;
  }

  public void show() {
    noStroke();
    fill(75);
    rect(myX, myY, myWidth, myHeight, 6, 6, 6, 6);
    fill(225);
    rect(myX, valY, myWidth, myWidth, 6, 6, 6, 6);
  }

  public int getX() {return myX;}
  public int getY() {return myY;}
  public int getWidth() {return myWidth;}
  public int getHeight() {return myHeight;}
  public int getValY() {return valY;}
  public void setValY(int val) {valY = val;}
}

public void showSidebar() {
  stroke(255);
  fill(200);
  rect(0, 30, 50, 840, 0, 6, 6, 0);
  colors = new Button[9];
  addColors();
  thicc = new Slider(10, 600, 30, 150);
  clear = new Button(12, 75, 75, 75);
}

public void showBottombar() {
  stroke(255);
  fill(200);
  rect(75, 850, 1150, 50, 6, 6, 0, 0);
  rainbow = loadImage("rainbow.png");
}

public void addColors() {
  colors[0] = new Button(0, 255, 0, 0);
  colors[1] = new Button(1, 255, 140, 0);
  colors[2] = new Button(2, 255, 255, 0);
  colors[3] = new Button(3, 0, 128, 0);
  colors[4] = new Button(4, 0, 0, 255);
  colors[5] = new Button(5, 75, 0, 130);
  colors[6] = new Button(6, 238, 130, 238);
  colors[7] = new Button(7, 0, 0, 0);
  colors[8] = new Button(8, 255, 255, 255);
}

public void showColors() {
  for (int i=0; i<9; i++) {
    colors[i].show();
  }
}

public void checkClear() {
  if (mousePressed && mouseX>10 && mouseX<40 && mouseY>clear.getPos() && mouseY<clear.getPos()+50) {
    clear.setClicked(true);
    noStroke();
    fill(255);
    rect(50, 0, 1290, 851);
  }
}

//the shapes/brush type buttons
public boolean rectBool = false;
public void rectangle() {
  noStroke();
  if (rectBool) {
    fill(255);
    rect(95, 856, 70, 40, 6, 6, 6, 6);
  } else {
    fill(200);
    rect(95, 856, 70, 40, 6, 6, 6, 6);
  }
  fill(75);
  rect(100, 861, 60, 30, 6, 6, 6, 6);
}

public boolean triBool = false;
public void tri() {
  noStroke();
  if (triBool) {
    fill(255);
    triangle(174, 895, 206, 855, 239, 895);
  } else {
    fill(200);
    triangle(174, 895, 206, 855, 239, 895);
  }
  fill(75);
  triangle(182, 891, 206, 861, 231, 891);
}

public boolean starBool = false;
public void star() {
  noStroke();
  if (starBool) {
    fill(255);
    beginShape();
    for (float i = 0; i < TWO_PI; i += TWO_PI/5) {
      float x = 270 + cos(i) * 25;
      float y = 877 + sin(i) * 25;
      vertex(x, y);
      x = 270 + cos(i+TWO_PI/5/2.0f) * 15;
      y = 877 + sin(i+TWO_PI/5/2.0f) * 15;
      vertex(x, y);
    }
    endShape(CLOSE);
  } else {
    fill(200);
    beginShape();
    for (float i = 0; i < TWO_PI; i += TWO_PI/5) {
      float x = 270 + cos(i) * 25;
      float y = 877 + sin(i) * 25;
      vertex(x, y);
      x = 270 + cos(i+TWO_PI/5/2.0f) * 15;
      y = 877 + sin(i+TWO_PI/5/2.0f) * 15;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
  fill(75);
  beginShape();
  for (float i = 0; i < TWO_PI; i += TWO_PI/5) {
    float x = 270 + cos(i) * 20;
    float y = 877 + sin(i) * 20;
    vertex(x, y);
    x = 270 + cos(i+TWO_PI/5/2.0f) * 10;
    y = 877 + sin(i+TWO_PI/5/2.0f) * 10;
    vertex(x, y);
  }
  endShape(CLOSE);
}

public boolean pointBool = false;
public void point() {
  noStroke();
  if (pointBool) {
    fill(255);
    circle(330, 875, 40);
  } else {
    fill(200);
    circle(330, 875, 40);
  }
  fill(75);
  circle(330, 875, 33);
}

//drawing
public void pen() {
  if (mousePressed && mouseX>50 && mouseY<840) {
    stroke(currentR, currentG, currentB);
    fill(currentR, currentG, currentB);
    strokeWeight(currentW);
    if (shapeMode == 0) {
      line(mouseX, mouseY, pmouseX, pmouseY);
    } else if (shapeMode == 1) {
      rect(mouseX, mouseY, 45, 30);
    } else if (shapeMode == 2) {
      triangle(mouseX, mouseY, mouseX+15, mouseY-30, mouseX+30, mouseY);
    } else if (shapeMode == 3) {
      beginShape();
      for (float i = 0; i < TWO_PI; i += TWO_PI/5) {
        float x = mouseX + cos(i) * 22;
        float y = mouseY + sin(i) * 22;
        vertex(x, y);
        x = mouseX + cos(i+TWO_PI/5/2.0f) * 10;
        y = mouseY + sin(i+TWO_PI/5/2.0f) * 10;
        vertex(x, y);
      }
      endShape(CLOSE);
    }
  }
}

//change colors
public void palette() {
  if (mousePressed && mouseX>10 && mouseX<40){
    for (int i=0; i<colors.length; i++) {
      Button now = colors[i];
      if (mouseY>now.getPos() && mouseY<now.getPos()+50) {
        now.setClicked(true);
        currentR = now.getR();
        currentG = now.getG();
        currentB = now.getB();
      }
    }
  }
}

//slider stuff
public void brushSize() {
  if (mousePressed && mouseX<50) {
    if (mouseY>thicc.getY() && mouseY<thicc.getY()+thicc.getHeight()-thicc.getWidth()) {
      thicc.setValY(mouseY);
      int sliderValue = thicc.getValY();
      int newSliderValue = (int) map(sliderValue, thicc.getY(), thicc.getY()+thicc.getHeight()-thicc.getWidth(), 3, 50);
      currentW = newSliderValue;
    }
  }
}

//change brush type
public void brushType() {
  if (mousePressed && mouseY>860 && mouseY<890) {
    if (mouseX<160 && mouseX>100) {shapeMode = 1; rectBool = true;}
    else if (mouseX>182 && mouseX<231) {shapeMode = 2; triBool = true;}
    else if (mouseX>240 && mouseX<300) {shapeMode = 3; starBool = true;}
    else if (mouseX>310 && mouseX<370) {shapeMode = 0; pointBool = true;}
  }
}

//i do it for the girls and the gays, that's it.
public boolean rainBool = false;
public void randomColor() {
  noStroke();
  if (rainBool) {
    fill(255);
    rect(1045, 859, 85, 36, 6, 6, 6, 6);
  } else {
    fill(200);
    rect(1045, 859, 85, 36, 6, 6, 6, 6);
  }
  image(rainbow, 1050, 857, 75, 40);
  if (mousePressed && mouseX>1050 && mouseX<1120 && mouseY>857 && mouseY<897){
    rainBool = true;
    currentR = 255-(int)(Math.random()*255);
    currentG = 255-(int)(Math.random()*255);
    currentB = 255-(int)(Math.random()*255);
  }
}
  public void settings() {  size(1300, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "canvas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
