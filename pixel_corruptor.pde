Corrupt img;  // class that controls all the pixels
PImage source; // source image
int rndIdx;// randomly generated index to put color values in

void setup(){
  size(500,375);// 3D could be cool here but figure out something to do
  source = loadImage("test.jpg");// with it first...
  image(source, 0, 0);
  img = new Corrupt();
  //println(img.getSize()); 187,500 pixels
}

void draw(){
  if(keyPressed){
    // corrupt pixels
    if(key == 'c' || key == 'C'){
      rndIdx = int(random(img.getSize()));
      img.changePixels(rndIdx);
    }// end if 'C'
    
    if(key == 'r' || key == 'R'){
      img.reloadPixels();
    }// end if 'R'
    
    if(key == 's' || key == 'S'){
      img.shufflePixels();
    }// end if 'S'
    
    if(key == 'b' || key == 'B'){
      img.blockShuffle();
    }// end if 'B'
    
    if(key == 'd' || key == 'D'){
      img.repixelOriginal();
    }// end if 'O'
    
  }// end if keyPressed
}// end draw()
