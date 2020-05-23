public Button[] buttons;
public int currentR = 0;
public int currentG = 0;
public int currentB = 0;

void setup() {
  size(1300, 900);
  background(255);
  showSidebar();
  buttons = new Button[10];
  addButtons();
  showButtons();
}

void draw() {


  if (mousePressed && mouseX>50 && pmouseX>50) {
    stroke(currentR, currentG, currentB);
    strokeWeight(3);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (mousePressed && mouseX>10 && mouseX<40){
    for (int i=0; i<3; i++) {
      Button now = buttons[i];
      if (mouseY>now.getPos() && mouseY<now.getPos()+60) {
        currentR = now.getR();
        currentG = now.getG();
        currentB = now.getB();
      }
    }
  }

  // if (mouseY>buttons[0].getPos() && mouseY<buttons[0].getPos()+60) {
  //   currentR = buttons[0].getR();
  //   currentG = buttons[0].getG();
  //   currentB = buttons[0].getB();
  // }


  // Button now = buttons[0];
  // currentR = now.getR();
  // currentG = now.getG();
  // currentB = now.getB();


}


public class Button {
  private int myIndex, myR, myG, myB, myPos;

  public Button(int index, int r, int g, int b) {
    myIndex = index;
    myR = r;
    myG = g;
    myB = b;
    myPos = 60*(myIndex+2);
  }


  public void mousePressed() {
    currentR = myR;
    currentG = myG;
    currentB = myB;

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

}

public void showSidebar() {
  stroke(255);
  fill(200);
  rect(0, 30, 50, 840, 0, 6, 6, 0);
}

public void addButtons() {
  buttons[0] = new Button(0, 255, 0, 0);
  buttons[1] = new Button(1, 0, 255, 0);
  buttons[2] = new Button(2, 0, 0, 255);
}

public void showButtons() {
  for (int i=0; i<3; i++) {
    buttons[i].show();
  }
}
