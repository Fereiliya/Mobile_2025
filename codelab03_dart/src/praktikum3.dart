void main(){
  //Step 1 and 2
  int index; //<--- Boleh seperti ini karena value ada di awal loop
  for (index = 10; index < 27; index++) {
  print(index);

  //Step 3
  if (index == 21) break;
    else if (index > 1 || index < 7) continue;
  print(index);
  }
}