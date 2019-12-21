float cellSize = 5;
int gridSize = 100;
boolean[][] grid = new boolean[gridSize][gridSize];
ArrayList<int[]> gridPoints = new ArrayList<int[]>();

void settings() {
  size((int)(cellSize*gridSize), (int)(cellSize*gridSize));
}

void setup() {
  //randomSeed(34);
   noStroke();
   fill(255, 255, 255);
   fillGridWithNoise();
   for (int i=0; i< 50; i++) {
   caverize(grid);
   }
   pruneCaves();
   pruneRocks();
   drawGrid();
}

void draw() {
}
