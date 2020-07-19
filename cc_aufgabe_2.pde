import javax.swing.*;

JOptionPane jop = new JOptionPane();

PGraphics bild;

boolean firstDraw = false;

boolean save;

float[][] values = new float[4][0];

int cou = 0;

int lineLength = 400;

void setup()
{
  size(1000, 1000, JAVA2D);
  
  bild = createGraphics(width, height);

  noStroke();

  cou = Integer.parseInt(jop.showInputDialog("Wie viele Dreiecke soll es geben?"));

  drawLogo();
}

void draw()
{
  
  //Saving of the Logo. Only gets triggered after the first draw so it doesnt continuosly ask.
  if (firstDraw == false)
  {
    JPanel savePath = new JPanel();
    savePath.setLayout(new BoxLayout(savePath, BoxLayout.PAGE_AXIS));
    JTextField path = new JTextField();
    savePath.add(new JLabel("Dateiname:"));
    savePath.add(path);

    int result = jop.showConfirmDialog(null, savePath, "Logo speichern?", JOptionPane.YES_NO_OPTION);
    if (result == jop.YES_OPTION)
    {
      bild.save(path.getText() + ".png");
    }
  }
  firstDraw = true;
}

void drawLogo()
{
  //Set the Background to White
  background(255);
  
  //Start a Matrix to draw withing
  pushMatrix();
  
  //Begin drawing the shape and set all the necessary parameters. Also draws the triangle Outline
  bild.beginDraw();
  bild.translate(width/2, height/2);
  
  bild.stroke(0);
  bild.strokeWeight(2);
  bild.noFill();
  bild.triangle(0, -lineLength, lineLength*cos(radians(30)), lineLength * sin(radians(30)), -lineLength*cos(radians(30)), lineLength*sin(radians(30)));
  bild.noStroke();

  //Draw the different Triangle using random dummy Values
  for (int i = 0; i<cou; i++)
  {
    color hCol = color(random(50,200),random(50,200),random(50,200));
    Triangle hTri = new Triangle(lineLength / random(1,4),lineLength / random(1,4),lineLength / random(1,4), hCol);
    hTri.drawTriangle();
  }
  
  bild.endDraw();

  popMatrix();
  
  //Draw the created Shape to the Canvas
  image(bild, 0, 0);
}
