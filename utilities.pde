float caverizingMinimum = 0.5;
float fillingMinimum = 0.51;


void fillGridWithNoise() {
  for (int i =2; i<grid.length-2; i++) {
    for (int j =2; j<grid[i].length-2; j++) {
      grid[i][j] = random(1)>0.48
        ? true : false;
    }
  }
}

void drawGrid() {
  background(0);
  for (int i =0; i<grid.length; i++) {
    for (int j =0; j<grid[i].length; j++) {
      if (grid[i][j]) {
        rect(j*cellSize, i*cellSize, cellSize, cellSize);
      }
    }
  }
}

void caverize(boolean[][] array) {
  boolean[][] result = new boolean[array.length][array[0].length];
  for (int i =0; i<array.length; i++) {
    for (int j =0; j<array[i].length; j++) {
      if (!array[i][j]) {
        int[] neighbours = countNeighbours(i, j, array);
        if ((float)neighbours[0]/(float)neighbours[1]>=caverizingMinimum) {
          result[i][j]=false;
        } else {
          result[i][j]=true;
        }
      } else {
        int[] neighbours = countNeighbours(i, j, array);
        if ((float)neighbours[0]/(float)neighbours[1]>=fillingMinimum) {
          result[i][j]=false;
        } else {
          result[i][j]=true;
        }
      }
    }
  }
  grid = result;
}

int[] countNeighbours(int i, int j, boolean[][] array) {
  int[] result = new int[2];
  for (int v=-1; v<=1; v++) {
  inner: 
    for (int w=-1; w<=1; w++) {
      if (v==0&&w==0) {
        continue inner;
      }
      if (0<=i+v&&i+v<array.length&&0<=j+w&&j+w<array[0].length) {
        result[1]++;
        if (!array[i+v][j+w]) {
          result[0]++;
        }
      }
    }
  }
  return result;
}

HashMap<PVector, Boolean> copyHashMap(HashMap<PVector, Boolean> hashmap) {
  HashMap<PVector, Boolean> copy = new HashMap<PVector, Boolean>();
  for ( PVector key : hashmap.keySet()) {
    copy.put(key, hashmap.get(key));
  }
  return copy;
}

void removeGridPoint(int x, int y) {
  for (int i = 0;i<gridPoints.size();i++) {
    if (gridPoints.get(i)[0]==x&&gridPoints.get(i)[1]==y) {
      gridPoints.remove(i);
      break;
    }
  }
}

void fillGridPointsArrayList() {
  for (int i=0; i<gridSize; i++) {
    for (int j=0; j<gridSize; j++) {
      int[] point = {j, i};
      gridPoints.add(point);
    }
  }
}
