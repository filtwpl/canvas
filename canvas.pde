
public Button[] colors;
public Slider thicc;
public Button clear;
public int currentR = 0;
public int currentG = 0;
public int currentB = 0;
public int currentW = 3;

void setup() {
  size(1300, 900);
  background(255);
  showSidebar();
  colors = new Button[9];
  addColors();
  showColors();
  thicc = new Slider(10, 600, 30, 150);
  clear = new Button(12, 40, 40, 40);
  clear.show();
}

void draw() {
  thicc.show();
  if (mousePressed && mouseX>50 && pmouseX>50) {
    stroke(currentR, currentG, currentB);
    strokeWeight(currentW);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (mousePressed && mouseX>10 && mouseX<40 && pmouseX>10 && pmouseX<40){
    for (int i=0; i<colors.length; i++) {
      Button now = colors[i];
      if (mouseY>now.getPos() && mouseY<now.getPos()+50) {
        currentR = now.getR();
        currentG = now.getG();
        currentB = now.getB();
      }
    }
  }
  if (mousePressed && mouseX<50) {
    if (mouseY>thicc.getY() && mouseY<thicc.getY()+thicc.getHeight()-thicc.getWidth()) {
      thicc.setValY(mouseY);
      int sliderValue = thicc.getValY();
      int newSliderValue = (int) map(sliderValue, thicc.getY(), thicc.getY()+thicc.getHeight()-thicc.getWidth(), 3, 40);
      currentW = newSliderValue;
    }
  }
  if (mousePressed && mouseX>10 && mouseX<40 && mouseY>clear.getPos() && mouseY<clear.getPos()+50) {
    noStroke();
    fill(255);
    rect(50, 0, 1290, 900);
  }
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
