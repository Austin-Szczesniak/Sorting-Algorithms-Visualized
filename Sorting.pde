int numLine = 1490;
int numWidth = 1;
int lineWidth = 1;
int[] heights = new int[numLine];
int[] pos = new int[numLine];
int maxHeight = 750;

void setup() 
{
  size(1500,800);
  background(0);
  strokeWeight(numWidth);
  stroke(255,0,0);
  
  int x = 0;
  int y = 0;
  
  //Create lines of varying heights and create list of heights and list of positions
  for(int i = 0; i < heights.length; i++)  
  {
    x += lineWidth;
    y = (int)random(maxHeight);
    pos[i] = x;
    heights[i] = y;
  }
  
  drawLines();
  
  for(int i = 0; i < heights.length; i++)  
  {
    System.out.println(heights[i] + "," + pos[i]);
  }
}

void draw()  
{  
 background(0);
 
 // Print frame rate
 textSize(32);
 text(frameRate, 10, 30); 
 
 //bubbleSort();
 insertSort();
}

void keyPressed()
{
  background(200);
  strokeWeight(numWidth);
  stroke(255,0,0);
  
  int x = 0;
  int y = 0;
  
  //Create lines of varying heights and create list of heights and list of positions
  for(int i = 0; i < heights.length; i++)  
  {
    x += lineWidth;
    y = (int)random(maxHeight);
    
    pos[i] = x;
    heights[i] = y;
  }
  
  for(int i = 0; i < heights.length; i++)  {
    System.out.println(heights[i] + "," + pos[i]);
  }
  
  drawLines();
}

//-------------------------- 
// Sorting functions
//--------------------------
void insertSort()
{
  int tempHeight = 0;
  
  //Compare all lines
  for(int i = 0; i < heights.length - 1; i++)  
  {
    if(heights[i+1] < heights[i])  
    {
      tempHeight = heights[i+1];
      heights[i+1] = heights[i];
      heights[i] = tempHeight;
    }
  }
  
  drawLines();
}

void bubbleSort()
{
  int tempHeight = 0;
  
  //create splits
  for(int i = 0; i < heights.length - 1; i++)
  {
    for(int j = 0; j < heights.length - i - 1; j++)
    {
      if(heights[j+1] < heights[j])
      {
        tempHeight = heights[j+1];
        heights[j+1] = heights[j];
        heights[j] = tempHeight;
      }
    }
    
    drawLines();
  }
}

//-------------------------- 
// Random functions
//--------------------------
void drawLines()
{
 int x = 0;
 int y = 0;
  
 // Drawing lines with new positions
 for(int i = 0; i < heights.length; i++)  
 { 
    x += lineWidth;
    y = heights[i];
 
    if(y < (maxHeight / 6))
    {
      fill(255,(y * 6),0);
      stroke(255,(y * 6),0);
    }
    else if(y < (maxHeight * (.33)))
    {
      fill(255 - ((y-(maxHeight / 6)) * 6),255,0);
      stroke(255 - ((y-(maxHeight / 6)) * 6),255,0);
    }
    else if(y < (maxHeight * (.5)))
    {
      fill(0,255,((y-(maxHeight * .33)) * 6));
      stroke(0,255,((y-(maxHeight * .33)) * 6));
    }
    else if(y < (maxHeight * (.66)))
    {
      fill(0,255 - ((y - (maxHeight * .5)) * 6),255);
      stroke(0,255 - ((y - (maxHeight * .5)) * 6),255);
    }
    else if(y < (maxHeight * (.83)))
    {
      fill(((y - (maxHeight * .66)) * 6),0,255);
      stroke(((y - (maxHeight * .66)) * 6),0,255);
    }
    else
    {
      fill(255,0,255-((y - (maxHeight * .83)) * 6));
      stroke(255,0,255-((y - (maxHeight * .83)) * 6));
    }
      ellipse(x,height - y,lineWidth,lineWidth);
      //line(x,height - y + lineWidth,x,height - y);
  }
}