class Sorter {
  PImage img;
  int[] pix;
  int width;
  int height;
  
  Sorter(PImage img) {
    this.img = img;
    width = img.width;
    height = img.height;
  }
  
  void loadPixels() {
    img.loadPixels();
    pix = img.pixels;
  }
  
  void updatePixels() {
    img.pixels = pix;
    img.updatePixels();
  }
  
  void pixSort(int x, int y, char direction, int len, int reverse, char mode) {
    if (x < 0 || x >= width || y < 0 || y >= height || len < 1) {
      return;
    }
    int loc = x + y * width;
    
    int[] pixSet = new int[len];
    if (direction == 'u') {
      // check if pixSet will run off edge
      if (y < len) {
        return;
      }
      
      // fill pixSet
      for (int i = 0; i < len; i++) {
        pixSet[i] = pix[loc - i * width];
      }
      
      // sort pixSet
      for (int i = 1; i < len; i++) {
        int j = i;
        while (j > 0 && colorData(pixSet[j - 1], mode) > reverse * colorData(pixSet[j], mode)) {
          int temp = pixSet[j];
          pixSet[j] = pixSet[j - 1];
          pixSet[j - 1] = temp;
          j--;
        }
      }
      
      // apply pixSet
      for (int i = 0; i < len; i++) {
        pix[loc - i * width] = pixSet[i];
      }
      
    } else if (direction == 'r') {
      // check if pixSet will run off edge
      if (width < x + len) {
        return;
      }
      
      // fill pixSet
      for (int i = 0; i < len; i++) {
        pixSet[i] = pix[loc + i];
      }
      
      // sort pixSet
      for (int i = 1; i < len; i++) {
        int j = i;
        while (j > 0 && colorData(pixSet[j - 1], mode) > reverse * colorData(pixSet[j], mode)) {
          int temp = pixSet[j];
          pixSet[j] = pixSet[j - 1];
          pixSet[j - 1] = temp;
          j--;
        }
      }
      
      // apply pixSet
      for (int i = 0; i < len; i++) {
        pix[loc + i] = pixSet[i];
      }
      
    } else if (direction == 'd') {
      
      // check if pixSet will run off edge
      if (height < y + len) {
        return;
      }

      // fill pixSet
      for (int i = 0; i < len; i++) {
        pixSet[i] = pix[loc + i * width];
      }
      
      // sort pixSet
      for (int i = 1; i < len; i++) {
        int j = i;
        while (j > 0 && colorData(pixSet[j - 1], mode) > reverse * colorData(pixSet[j], mode)) {
          int temp = pixSet[j];
          pixSet[j] = pixSet[j - 1];
          pixSet[j - 1] = temp;
          j--;
        }
      }
      
      // apply pixSet
      for (int i = 0; i < len; i++) {
        pix[loc + i * width] = pixSet[i];
      }
      
    } else if (direction == 'l') {
      // check if pixSet will run off edge
      if (x < len) {
        return;
      }
      
      // fill pixSet
      for (int i = 0; i < len; i++) {
        pixSet[i] = pix[loc - i];
      }
      
      // sort pixSet
      for (int i = 1; i < len; i++) {
        int j = i;
        while (j > 0 && colorData(pixSet[j - 1], mode) > reverse * colorData(pixSet[j], mode)) {
          int temp = pixSet[j];
          pixSet[j] = pixSet[j - 1];
          pixSet[j - 1] = temp;
          j--;
        }
      }
      
      // apply pixSet
      for (int i = 0; i < len; i++) {
        pix[loc - i] = pixSet[i];
      } 
    }
  }
  
  float colorData(int c, char mode) {
    switch (mode) {
      case 'a' : return alpha(c);
      case 'b' : return blue(c);
      case 'g' : return green(c);
      case 'h' : return hue(c);
      case 'i' : return brightness(c);
      case 'r' : return red(c);
      case 's' : return saturation(c);
    }
    return -1;
  }
}
