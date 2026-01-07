void main(){
  // STEP 1 and 2
  int counter = 0; //<--- Counter
  while (counter < 33) {
    print(counter);
    counter++;
  }

  // STEP 3
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}