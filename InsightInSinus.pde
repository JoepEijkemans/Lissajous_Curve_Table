/*
Joep Eijkemans 23-07-19
Processing 3.4

Creates a lissajous curve table by matching rows and colums of sine functions with different frequencies

www.joepeijkemans.nl
*/

int NumberOfCircles = 10; //doesn't scale with screen size
float Xpos[] = new float[NumberOfCircles];
float Ypos[] = new float[NumberOfCircles];
int Radius = 40;

void setup() {
  frameRate(10); //very high to ensure smooth lines
  size(1030, 1030);
  background(0);
}

void draw() {
  float t = millis()/20000.0f; //The time variable
  RemovePastFrameDots();
  for (int p = 0; p < NumberOfCircles - 1; p++) {
    fill(170,20,220);
    Xpos[p] = (float) Radius*-sin(t * (p + 1)) + p*100; 
    Ypos[p] = (float) Radius *cos(t * (p + 1));
    ellipse(int(Xpos[p]) + 165, 65, 5, 20);
    Xpos[p] = (float) Radius*-sin(t * (p + 1)); 
    Ypos[p] = (float) Radius *cos(t * (p + 1)) + p*100;
    ellipse(65, int(Ypos[p]) + 165, 20, 5);
  }

  for (int i = 0; i < NumberOfCircles - 1; i++) {
    Xpos[i] = (float) Radius*-sin(t * (i + 1)) + i*100; 
    Ypos[i] = (float) Radius *cos(t * (i + 1)) + i*100;

    for (int u = 0; u < NumberOfCircles - 1; u++) {
      set(int(Xpos[i]) + 165, int(Ypos[u]) + 165, color(u*40 - i * 10,130, i * 45 - (u * 25))); //makes colors nice
    }
  }
  //saveFrame("Output/Frame_####.png"); //used to record a .mov 
}

void RemovePastFrameDots() {
  fill(0); //black
  rect(0, 0, width, 100);
  rect(0, 0, 100, height);
}
