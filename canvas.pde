
PImage rainbow;
public Button[] colors;
public Slider thicc;
public Button clear;
public int currentR = 0;
public int currentG = 0;
public int currentB = 0;
public int currentW = 3;
public int shapeMode = 0;

void setup() {
  size(1300, 900);
  background(255);
  showSidebar();
  showBottombar();
}

void draw() {
  thicc.show();
  textSize(20);
  fill(125, 142, 209);
  text("made for planet hacks 2020 by jm with processing <3", 420, 882);
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

public class Button {
  private int myIndex, myR, myG, myB, myPos;

  public Button(int index, int r, int g, int b) {
    myIndex = index;
    myR = r;
    myG = g;
    myB = b;
    myPos = 60*(myIndex+1);
  }

  public void show() {
    noStroke();
    fill(myR, myG, myB);
    rect(10, myPos, 30, 50, 6, 6, 6, 6);
  }

  public int getPos() {return myPos;}
  public int getR() {return myR;}
  public int getG() {return myG;}
  public int getB() {return myB;}
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
  showColors();
  thicc = new Slider(10, 600, 30, 150);
  clear = new Button(12, 40, 40, 40);
  clear.show();
}

public void showBottombar() {
  stroke(255);
  fill(200);
  rect(75, 850, 1150, 50, 6, 6, 0, 0);
  rectangle();
  tri();
  star();
  point();
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

public void rectangle() {
  noStroke();
  fill(75);
  rect(100, 860, 60, 30);
}

public void tri() {
  noStroke();
  fill(75);
  triangle(171, 889, 200, 859, 229, 889);
}

public void star() {
  noStroke();
  fill(75);
  beginShape();
  for (float i = 0; i < TWO_PI; i += TWO_PI/5) {
    float x = 270 + cos(i) * 20;
    float y = 875 + sin(i) * 20;
    vertex(x, y);
    x = 270 + cos(i+TWO_PI/5/2.0) * 10;
    y = 875 + sin(i+TWO_PI/5/2.0) * 10;
    vertex(x, y);
  }
  endShape(CLOSE);
}

public void point() {
  noStroke();
  fill(75);
  circle(330, 875, 33);
}

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
        x = mouseX + cos(i+TWO_PI/5/2.0) * 10;
        y = mouseY + sin(i+TWO_PI/5/2.0) * 10;
        vertex(x, y);
      }
      endShape(CLOSE);
    }
  }
}

public void palette() {
  if (mousePressed && mouseX>10 && mouseX<40){
    for (int i=0; i<colors.length; i++) {
      Button now = colors[i];
      if (mouseY>now.getPos() && mouseY<now.getPos()+50) {
        currentR = now.getR();
        currentG = now.getG();
        currentB = now.getB();
      }
    }
  }
}

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

public void brushType() {
  if (mousePressed && mouseY>860 && mouseY<890) {
    if (mouseX<160 && mouseX>100) shapeMode = 1;
    else if (mouseX>170 && mouseX<230) shapeMode = 2;
    else if (mouseX>240 && mouseX<300) shapeMode = 3;
    else if (mouseX>310 && mouseX<370) shapeMode = 0;
  }
}

//i do it for the girls and the gays, that's it.
public void randomColor() {
  image(rainbow, 1050, 857, 75, 40);
  if (mousePressed && mouseX>1050 && mouseX<1120 && mouseY>857 && mouseY<897){
    currentR = 255-(int)(Math.random()*255);
    currentG = 255-(int)(Math.random()*255);
    currentB = 255-(int)(Math.random()*255);
  }
}

public void checkClear() {
  if (mousePressed && mouseX>10 && mouseX<40 && mouseY>clear.getPos() && mouseY<clear.getPos()+50) {
    noStroke();
    fill(255);
    rect(50, 0, 1290, 851);
  }
}
