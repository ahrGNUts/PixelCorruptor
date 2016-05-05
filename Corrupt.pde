class Corrupt {
  int pxSize;// size of pixel array
  color[]initialState;// array for holding original pixels
  
  // default
  Corrupt(){
    
    loadPixels();
    pxSize = pixels.length;
    initialState = new color[pxSize];
    
    // preserves original pixels in array to be reloaded when called
    for(int i = 0; i < pxSize; i++){
      initialState[i] = pixels[i];
    }// end for
  }// end constructor
  
  void reloadPixels(){
    
    for(int i = 0; i < pxSize; i++){
      pixels[i] = initialState[i];
    }
    updatePixels();
  }// end reloadPixels()
  
  int getSize(){
    return pixels.length;
  }
  
  void changePixels(int index){
    for(int i = 0; i < 1250; i++){
      pixels[int(random(index))] = color(random(255), random(255), random(255));
    }// end for
    updatePixels();
  }// end changePixel()
  
  void shufflePixels(){
    for(int i = 0; i < 1250; i++){
      pixels[int(random(pixels.length))] = initialState[int(random(pixels.length))];
    }// end for
    updatePixels();
  }// end shufflePixels()
  
  // this creates a nice effect but it's more of a bar than a block
  // the pixels in the sketch are 500 columns by 375 rows
  void blockShuffle(){
    final int BLOCKSIZE = 8000; 
    
    color[]swap = new color[BLOCKSIZE];
    color[]blk1 = new color[BLOCKSIZE];
    color[]blk2 = new color[BLOCKSIZE];
    // create first random index
    int rndIdx1 = int(random(0,pixels.length-BLOCKSIZE));
    // get second random index
    int rndIdx2 = int(random(0,pixels.length-BLOCKSIZE));
    
    // lots of inefficient looping. maybe use recursion if
    // everything here works eventually?
    
    // populate block 1
    for(int j = rndIdx1, i = 0; i < BLOCKSIZE; j++, i++)
    {
      blk1[i] = pixels[j];
    }// end for
    
    // populate block 2
    for(int j = rndIdx2, i = 0; i < BLOCKSIZE; i++, j++)
    {
      blk2[i] = pixels[j];
    }// end for
    
    // swap
    for(int i = 0; i < BLOCKSIZE; i++)
    {
      swap[i] = blk1[i];
      blk1[i] = blk2[i];
      blk2[i] = swap[i];
    }// end for
    
    // repopulate pixels with swapped first block
    for(int j = rndIdx1, i = 0; i < BLOCKSIZE; i++, j++)
    {
      pixels[j] = blk1[i];
        // shuffle in second block
        for(int k = rndIdx2, t = 0; t < BLOCKSIZE; t++)
        {
          pixels[k] = blk2[t];
        }// end for
    }// end for
    updatePixels();
    
  }// end blockShuffle()
  
  // doesn't do anything yet....
  void repixelOriginal(){
    int origIdx = int(random(0, pixels.length));
    
    for(int i = origIdx, j = 0; j < 4500; i++, j++)
    {
      // wrap around if out of array bounds
      if(i < pixels.length){
        i = 0;
      }// end if
      
      pixels[i] = initialState[j];
      
    }// end for
    updatePixels();
  }// end repixelOriginal()
  
}// end Corrupt