class Button {
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  Button(float x, float y, char val) {
    this.x = x;
    this.y = y;
    this.val = val;
    w = 50;
    h = 30;
    c1 = color(60);
    c2 = color(177);
    hover = false;
  }

  void display() {
    rectMode(CENTER);
    stroke(0);
    fill(hover ? c1 : c2);
    rect(x, y, w, h);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(18);
    text(val, x, y);
  }

  void mouseOver(float tempX, float tempY) {
    hover = tempX > x-w/2 && tempX < x+w/2 &&
      tempY > y-h/2 && tempY < y+h/2;
  }
}
