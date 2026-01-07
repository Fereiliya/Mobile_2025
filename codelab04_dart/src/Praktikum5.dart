void main(List<String> args) {
  //Step 1
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  //Step 3
  var anotherRecord = (1, 2);
  print(anotherRecord);
  var swappedRecord = tukar(anotherRecord);
  print(swappedRecord);

  // Step 4
  // (String, int) mahasiswa; - Not working, it's null.
  // (String, int) mahasiswa = (2341720083, 'Afrizal Qurratul Faizin'); - swap it and it works.

  // Record type annotation in a variable declaration - Step 4:
  (String, int) mahasiswa = ('Afrizal Qurratul Faizin', 2341720083);
  print(mahasiswa);

  // Step 5
  var mahasiswa2 = ('Afrizal Qurratul Faizin', a: 2, b: 2341720083, 'last');
  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

// Step 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
