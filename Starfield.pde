Star[] field;
StarShip ship;
int starNum = 70;
boolean warpOn = true;
void setup()
{
  noStroke();
  size(500,500);
  background(0,0,0);
  field = new Star[starNum];
  for (int a = 0; a < starNum; a++)
  {
    field[a] = new Star();
  }
  ship = new StarShip();
}

void draw()
{
  fill(0,0,0, 50);
  rect(0,0,500,500);
  for(int b = 0; b < field.length; b++)
  {
    if (warpOn == true)
    {
      field[b].move();
      ship.move();
    }
    field[b].show();
    ship.show();
  }
}
  
void mousePressed()
{
  if (warpOn == false)
  {
    warpOn = true;
  } else 
  {
    warpOn = false;
  }
}
  
class Star
{
  double xCoord, yCoord, speed, angle;
  float distance;
  Star()
  {
    xCoord = 250;
    yCoord = 250;
    speed = Math.random() * 10 + 1;
    angle = Math.random() * 2 * PI;
  }
  void move ()
  {
    xCoord += speed * Math.cos(angle);
    yCoord += speed * Math.sin(angle);
    if ((xCoord > 500) || (xCoord < 0))
    {
      xCoord = 250;
      yCoord = 250;
      speed = Math.random() * 8 + 1;
      angle = Math.random() * 2 * PI;
    }
    if ((yCoord > 500) || (yCoord < 0))
    {
      xCoord = 250;
      yCoord = 250;
      speed = Math.random() * 8 + 1;
      angle = Math.random() * 2 * PI;
    }
  }
  void show ()
  {
    distance = dist((float)xCoord,(float)yCoord,250,250);
    
    //blueshift
    if (warpOn == true)
    {
      if (distance < 20)
      {
        fill(100 + .1* distance, 100 + .1 * distance, 100 + 10 * distance);
      } else if(distance < 100)
      {
        fill(200 + .1* distance, 200 + .1 * distance, 200 + 10 * distance);
      } else if (distance > 200)
      {
        fill(200 + 10* distance, 150 + .1 * distance, 150 + .1 * distance);
      } else
      {
        fill(255);
      }
    } else 
    {
      fill(255);
    }
    
    //star
      ellipse((float)xCoord, (float)yCoord, 2,2);
    }
}

class StarShip extends Star
{
  void move()
  {
    xCoord += (speed * Math.cos(angle)) * .05;
    yCoord += (speed * Math.sin(angle)) * .05;
    if ((xCoord > 500) || (xCoord < 0))
    {
      xCoord = 250;
      yCoord = 250;
      speed = Math.random() * 3 + 1;
      angle = Math.random() * 2 * PI;
    }
    if ((yCoord > 500) || (yCoord < 0))
    {
      xCoord = 250;
      yCoord = 250;
      speed = Math.random() * 3 + 1;
      angle = Math.random() * 2 * PI;
    }
  }
  void show()
  {
    fill(153, 245, 110);
    ellipse((float)xCoord, (float)yCoord , 5,5);
    fill(70);
    bezier((float)xCoord + 10, (float)yCoord + 5, (float)xCoord + 10, (float)yCoord, (float)xCoord -10, (float)yCoord, (float)xCoord - 10, (float)yCoord + 5);
  }
}
