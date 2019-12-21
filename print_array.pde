void print_array(float[] array) {
  print("[\n");
  for (int i=0; i<array.length; i++) {
    print(array[i]);
    if (i!=array.length-1) {
      print("  ");
    }
  }
  print("\n]\n");
}

void print_array(float[][] array) {
  print("[\n");
  for (int i=0; i<array.length; i++) {
    for (int j=0; j<array[0].length; j++) {
      print(array[i][j]);
      if (j!=array[i].length-1) {
        print("  ");
      } else {
      print("\n");
      }
    }
  }
  print("]\n");
}

void print_array(int[][] array) {
  print("[\n");
  for (int i=0; i<array.length; i++) {
    for (int j=0; j<array[0].length; j++) {
      print(array[i][j]);
      if (j!=array[i].length-1) {
        print("  ");
      } else {
      print("\n");
      }
    }
  }
  print("]\n");
}

void print_array(int[] array) {
  print("[\n");
  for (int i=0; i<array.length; i++) {
    print(array[i]);
    if (i!=array.length-1) {
      print("  ");
    }
  }
  print("\n]\n");
}
