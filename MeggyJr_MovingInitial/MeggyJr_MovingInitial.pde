#include <MeggyJrSimple.h>

int marker = 15;

int direction = 270;

struct Point{
  int x;    //x-coordinate of this point.
  int y;    //y-coordinate of this point.
};


  Point s1 = {1,0};
  Point s2 = {1,1};
  Point s3 = {1,2};
  Point s4 = {1,3};
  Point s5 = {1,4};
  Point s6 = {1,5};
  Point s7 = {1,6};
  Point s8 = {1,7};
  Point s9 = {2,5};
  Point s10 = {3,6};
  Point s11 = {4,7};
  Point s12 = {2,3};
  Point s13 = {3,2};
  Point s14 = {4,1};
  Point s15 = {5,0};

Point kayArray[64] = {s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15};


void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{
  drawK();
  DisplaySlate();
  delay(200);
  ClearSlate();
  CheckButtonsDown();
    for (int j = 0; j < marker; j++){
      if (Button_Up){
        direction = 0;
      }
      if (Button_Down){
        direction = 180;
      }
      if (Button_Right){      
        direction = 90;
      }
      if (Button_Left){
        direction = 270;
      }
      if(kayArray[j].y > 7 ){    //If the ycoord is greater than 8, loop it back to the bottom.
        kayArray[j].y = 0;
      }
      if (direction == 90){    //Directoin 90 is right, which is xcoord++
        kayArray[j].x++;
      }
     if (kayArray[j].x > 7){    //If the xcoord is greater than 8, loop it back to the left side.
        kayArray[j].x = 0;
      }
     if (direction == 180){    //Direction 180 is down, which is ycoord--.
        kayArray[j].y--;
     }
     if (kayArray[j].y < 0){    //If the ycoord is less than 0, loop it to the top.
        kayArray[j].y = 7;
      }
     if (direction == 270){    //Direction 270 is left, which is xcoord--.
        kayArray[j].x--;
      }
      if (kayArray[j].x < 0){    //If the xcoord is less than 0, loop it to the right.
        kayArray[j].x = 7;  
      }
      if (direction == 0){
        kayArray[j].y++;
      }
    }  
}

void drawK()
{
  for (int i = 0; i < marker; i++){
    DrawPx(kayArray[i].x, kayArray[i].y, Blue);
  }
}



