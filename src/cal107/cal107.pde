//Lucas li |2026-10-12 |CAL
String displayVal;
float l, r, result;
char op;
boolean left, newEntry;
Button[] nums = new Button[10];
Button[] sym = new Button[12];
String equation = "";

void setup() {
  size(400, 430);
  nums[7] = new Button(80, 190, '7');
  nums[8] = new Button(140, 190, '8');
  nums[9] = new Button(200, 190, '9');
  nums[4] = new Button(80, 235, '4');
  nums[5] = new Button(140, 235, '5');
  nums[6] = new Button(200, 235, '6');
  nums[1] = new Button(80, 280, '1');
  nums[2] = new Button(140, 280, '2');
  nums[3] = new Button(200, 280, '3');
  nums[0] = new Button(140, 325, '0');
  sym[0] = new Button(260, 325, '+');
  sym[1] = new Button(260, 280, '-');
  sym[2] = new Button(260, 235, 'x');
  sym[3] = new Button(260, 190, '/');
  sym[4] = new Button(200, 325, '.');
  sym[5] = new Button(260, 370, '=');
  sym[6] = new Button(80, 145, 'C');
  sym[7] = new Button(140, 145, '←');
  sym[8] = new Button(200, 145, '%');
  sym[9] = new Button(80, 325, '±');
  sym[10] = new Button(260, 145, '√');
  sym[11] = new Button(200, 370, '²');
  clearCalculator();
}

void clearCalculator() {
  displayVal = "0.0";
  l = r = result = 0.0;
  left = true;
  op = ' ';
  newEntry = true;
  equation = "";
}

void draw() {
  background(255);
  updateDisplay();
  for (Button b : nums) {
    b.mouseOver(mouseX, mouseY);
    b.display();
  }
  for (Button b : sym) {
    b.mouseOver(mouseX, mouseY);
    b.display();
  }
}

void updateDisplay() {
  rectMode(CENTER);
  fill(230);
  stroke(0);
  rect(170, 75, 230, 70);
  fill(0);
  textAlign(RIGHT, CENTER);
  textSize(20);

  String fullEquation = equation + displayVal;
  if (!left && newEntry) fullEquation = equation;
  text(fullEquation, 275, 75);
}

void storeEntry() {
  if (left) l = float(displayVal);
  else r = float(displayVal);
}

void mouseReleased() {
  for (Button b : nums) {
    b.mouseOver(mouseX, mouseY);
    if (b.hover) {
      if (left && newEntry) equation = "";

      if (newEntry) displayVal = str(b.val);
      else displayVal += str(b.val);
      newEntry = false;
      storeEntry();
      return;
    }
  }
  for (Button b : sym) {
    b.mouseOver(mouseX, mouseY);
    if (b.hover) {
      handleSymbol(b.val);
      return;
    }
  }
}

void handleSymbol(char value) {
  if (value == 'C') {
    clearCalculator();
    return;
  }
  if (value == '+' || value == '-' || value == 'x' || value == '/') {
    equation = displayVal + " " + value + " ";

    l = float(displayVal);
    op = value;
    left = false;
    newEntry = true;
  } else if (value == '=') {
    if (left || newEntry || op == ' ') return;
    if (op == '+') result = l + r;
    else if (op == '-') result = l - r;
    else if (op == 'x') result = l * r;
    else if (op == '/') result = l / r;

    equation += displayVal + " = ";

    displayVal = str(result);
    left = true;
    newEntry = true;
    println("l: " + l + "   r: " + r + "   result: " + result
      + "   left: " + left + "   op: " + op);
  } else if (value == '.') {
    if (left && newEntry) equation = "";

    if (newEntry) displayVal = "0";
    if (!displayVal.contains(".")) displayVal += ".";
    newEntry = false;
    storeEntry();
  } else if (value == '←') {
    if (newEntry) return;
    displayVal = displayVal.substring(0, max(0, displayVal.length()-1));
    if (displayVal.equals("") || displayVal.equals("-")) displayVal = "0";
    storeEntry();
  } else {
    if (left && newEntry) equation = "";

    float number = float(displayVal);
    if (value == '±') number = -number;
    else if (value == '%') number /= 100;
    else if (value == '√') number = sqrt(number);
    else if (value == '²') number *= number;
    displayVal = str(number);
    storeEntry();
    newEntry = false;
  }
}

void keyPressed() {
  if (key >= '0' && key <= '9') {
    if (left && newEntry) equation = "";

    if (newEntry) displayVal = str(key);
    else displayVal += str(key);
    newEntry = false;
    storeEntry();
  } else if (key == '*') {
    handleSymbol('x');
  } else if (key == ENTER || key == RETURN) {
    handleSymbol('=');
  } else if (key == BACKSPACE) {
    handleSymbol('←');
  } else if (key == 'c' || key == 'C') {
    handleSymbol('C');
  } else if (key == '+' || key == '-' || key == 'x' ||
    key == '/' || key == '.' || key == '=' ||
    key == '%' || key == '±' || key == '√' ||
    key == '²') {
    handleSymbol(key);
  }
}
