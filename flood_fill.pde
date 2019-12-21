HashMap<PVector, Boolean> closed = new HashMap<PVector, Boolean>();
HashMap<PVector, Boolean> open = new HashMap<PVector, Boolean>();
PVector[] directions = {new PVector(-1, 0), new PVector(1, 0), new PVector(0, 1), new PVector(0, -1)};
PVector current = new PVector(0, 0);
ArrayList<HashMap<PVector, Boolean>> caves = new ArrayList<HashMap<PVector, Boolean>>();
int minimumRockSize = 22;
int minimumCaveSize = 50;

void floodFill(int x, int y, boolean rockOrCave) {
  open.put(new PVector(x, y), true);
  while (0<open.keySet().size()) {
    for ( PVector key : open.keySet()) {
      current = key;
      break;
    }
    evaluatePoint(rockOrCave);
    closed.put(current, true);
    open.remove(current);
    removeGridPoint((int)current.x, (int)current.y);
  }
  caves.add(copyHashMap(closed));
  closed.clear();
  open.clear();
}

void evaluatePoint(boolean rockOrCave) {
  for (PVector p : directions) {
    PVector pointer = addVectors(current, p);
    if (open.get(pointer)==null&&closed.get(pointer)==null&&0<=pointer.x&&pointer.x<grid[0].length&&0<=pointer.y&&pointer.y<grid.length&&grid[(int)pointer.y][(int)pointer.x]==rockOrCave) {
      open.put(pointer, true);
    }
  }
}

PVector addVectors(PVector vector1, PVector vector2) {
  return new PVector(vector1.x+vector2.x, vector1.y+vector2.y);
}

void pruneCaves() {
  checkEveryPointForRocksOrCaves(true);
  filterOutSmallestCaves();
  removeSmallestRocksOrCaves(true);
}

void pruneRocks() {
  checkEveryPointForRocksOrCaves(false);
  filterOutSmallestRocks();
  removeSmallestRocksOrCaves(false);
}

void checkEveryPointForRocksOrCaves(boolean rockOrCave) {
  fillGridPointsArrayList();
  while (0<gridPoints.size()) {
    int x = gridPoints.get(0)[0];
    int y = gridPoints.get(0)[1];
    if (grid[y][x]==rockOrCave) {
      floodFill(x, y, rockOrCave);
    } else {
      gridPoints.remove(0);
    }
  }
}

void filterOutSmallestCaves() {
  for (int i = caves.size()-1; i>=0; i--) {
    int caveSize = caves.get(i).keySet().size();
    if (minimumCaveSize<caveSize) {
      caves.remove(i);
    }
  }
}

void filterOutSmallestRocks() {
  for (int i = caves.size()-1; i>=0; i--) {
    int caveSize = caves.get(i).keySet().size();
    if (minimumRockSize<caveSize) {
      caves.remove(i);
    }
  }
}

void removeSmallestRocksOrCaves(boolean rockOrCave) {
  for (int i = 0; i<caves.size(); i++) {
    for ( PVector key : caves.get(i).keySet()) {
      grid[(int)key.y][(int)key.x]=!rockOrCave;
    }
  }
  caves.clear();
}
