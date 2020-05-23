public Button[] colors;
public Button eraser;
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
}

void draw() {
  if (mousePressed && mouseX>50 && pmouseX>50) {
    stroke(currentR, currentG, currentB);
    strokeWeight(currentW);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (mousePressed && mouseX>10 && mouseX<40){
    for (int i=0; i<colors.length; i++) {
      Button now = colors[i];
      if (mouseY>now.getPos() && mouseY<now.getPos()+60) {
        currentR = now.getR();
        currentG = now.getG();
        currentB = now.getB();
        currentW = now.getW();
      }
    }
  }
}


public class Button {
  private int myIndex, myR, myG, myB, myW, myPos;

  public Button(int index, int r, int g, int b, int w) {
    myIndex = index;
    myR = r;
    myG = g;
    myB = b;
    myW = w;
    myPos = 60*(myIndex+1);
  }

  public void show() {
    stroke(myR, myG, myB);
    fill(myR, myG, myB);
    rect(10, myPos, 30, 50, 6, 6, 6, 6);
  }

  public int getPos() {return myPos;}
  public int getR() {return myR;}
  public int getG() {return myG;}
  public int getB() {return myB;}
  public int getW() {return myW;}
}

public void showSidebar() {
  stroke(255);
  fill(200);
  rect(0, 30, 50, 840, 0, 6, 6, 0);
}

public void addColors() {
  colors[0] = new Button(0, 255, 0, 0, 3);
  colors[1] = new Button(1, 255, 140, 0, 3);
  colors[2] = new Button(2, 255, 255, 0, 3);
  colors[3] = new Button(3, 0, 128, 0, 3);
  colors[4] = new Button(4, 0, 0, 255, 3);
  colors[5] = new Button(5, 75, 0, 130, 3);
  colors[6] = new Button(6, 238, 130, 238, 3);
  colors[7] = new Button(7, 0, 0, 0, 3);
  colors[8] = new Button(8, 255, 255, 255, 8);
}

public void showColors() {
  for (int i=0; i<9; i++) {
    colors[i].show();
  }
}
