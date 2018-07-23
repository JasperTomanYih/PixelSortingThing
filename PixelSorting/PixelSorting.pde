PImage cover;
PImage temp;
boolean recording = false;

void setup() {
  cover = loadImage("data/Puberty 2_800.jpg");
  size(800, 800);
}

void draw() {
  cover.loadPixels();

  Sorter s = new Sorter(cover);
  s.loadPixels();
  
  if (frameCount > 1) {
    for (int x = cover.width - 1; x > 0; x--) {
      for (int y = 0; y < cover.height; y++) {
        int loc = x + y * cover.width;
        if (blue(cover.pixels[loc]) < 100) {
          s.pixSort(x, y, 'd', 3, 1, 'b');
          s.pixSort(x, y, 'l', 3, 1, 's');
          s.pixSort(x, y, 'u', 3, 1, 's');
          s.pixSort(x, y, 'r', 3, 1, 's');
        }
      }
    }
  }
  s.updatePixels();
  image(cover, 0, 0, width, height);

  if (recording) {
    saveFrame("outVid/frame_####.png");
  }
}

void keyPressed() {
  if (key == 's') {
    save("outStill/imgOut_" + year() + "-" + month() + "-" + day() + "_" + hour() + "-" + minute() + "-" + second() + ".png");
  }
  if (key == 'r') {
    recording = !recording;
  }
}
