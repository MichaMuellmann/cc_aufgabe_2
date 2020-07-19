class Triangle
{
  float triX;
  float triY;
  float triZ;
  
  color col;
  
  Triangle(float px, float py, float pz, color pc)
  {
    triX = px;
    triY = py;
    triZ = pz;
    
    col = pc;
  }
  
  void drawTriangle()
  { 
    bild.fill(col, 125);
    //stroke(c);
    //pushMatrix();
  
  
    bild.beginShape();
  
    bild.vertex(0, -triX);
  
    bild.vertex(-(triZ * cos(radians(30))), triZ * sin(radians(30)));
  
    bild.vertex(triY * cos(radians(30)), triY * sin(radians(30)));
  
    bild.endShape(CLOSE);
    //popMatrix();
  }
}
