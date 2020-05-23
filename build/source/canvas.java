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


public SideBar menu;
public int currentR = 0;
public int currentG = 0;
public int currentB = 0;

public void setup() {
  
  background(255);
  menu = new SideBar();
  menu.addButton(255, 0, 0);
  menu.show();
}

public void draw() {


  if (mousePressed && mouseX>50 && pmouseX>50) {
    stroke(currentR, currentG, currentB);
    strokeWeight(3);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (keyPressed && key == 'c') {
    currentR = 255;
    currentG = 0;
    currentB = 0;
  }



}


public class SideBar {
  private int myX, myY, myWidth, myHeight, myCurve, myCol;
  private int nextIndex;
  private Button[] buttons;

  public SideBar() {
    myX = 0;
    myY = 30;
    myWidth = 50;
    myHeight = 840;
    myCurve = 6;
    myCol = 200;
    buttons = new Button[10];
    nextIndex = 0;
  }

  public void addButton(int r, int g, int b) {
    buttons[nextIndex] = new Button(nextIndex, r, g, b);
    nextIndex++;
  }

  public void show() {
    stroke(255);
    fill(myCol);
    rect(myX, myY, myWidth, myHeight, 0, myCurve, myCurve, 0);
    int pos = buttons[0].getPos();
    stroke(buttons[0].getR(), buttons[0].getG(), buttons[0].getB());
    fill(buttons[0].getR(), buttons[0].getG(), buttons[0].getB());
    rect(myX+10, pos, 30, 50);
  }

}

public class Button {
  private int myIndex, myR, myG, myB, myPos;
  private boolean on;

  public Button(int index, int r, int g, int b) {
    myIndex = index;
    myR = r;
    myG = g;
    myB = b;
    myPos = 60*(myIndex+2);
    on = false;
  }

  public void flipSwitch() {
    on = !on;
  }


  public int getIndex() {return myIndex;}
  public int getPos() {return myPos;}
  public int getR() {return myR;}
  public int getG() {return myG;}
  public int getB() {return myB;}
  public boolean getOn() {return on;}

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
