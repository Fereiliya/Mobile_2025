void main() {
  //Step 1
  //var list = [1, 2, 3];
  
  //Step 3
  final list = [null, "Afrizal Qurratul Faizin", 2341720083, null, null];
  assert(list.length == 5);
  assert(list[1] != 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
}
