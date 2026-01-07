void main(List<String> args) {
  // Nomer 3-1 - Positional Parameter
  sayhello('Grimm', 'Hello');
  sayhello2('Yukina');

  print("==========================");
  weaponStats(name: '\"The Chariot\"', materialID: 1001);
  weaponStats(materialID: 1002, name: 'Durandal');

  print("==========================");
  printCharName(name: 'Keqing');
  //printCharName(); <-- Error

  // ====================[ NOMER 4 ]==================== //
  // Function sebagai first-class objects
  // Nomer 4-1
  print("==========================");
  var namaKarakter = printCharName;
  namaKarakter(name: 'Ayaka Yukina');

  // Nomer 4-2
  print("==========================");
  executeFunction(
    windetteQuote,
    42,
    'OH! BANANA!');
  
  // Nomer 4-3
  print("==========================");
  var multiplyBy3 = multiply(3);
  print(multiplyBy3(10));

  // ====================[ NOMER 5 ]==================== //
  print("==========================");
  // Anonymous Function
  var roseliaMembers = ['Yukina', 'Sayo', 'Lisa', 'Ako', 'Rinko'];
  // For Each Anon Function
  roseliaMembers.forEach((member) {
    print(member);
  });
  // Map Anon Function, mengubah tiap elemen list
  var lengths = roseliaMembers.map((member) => member.length);
  print(lengths);
}

// Fungsi dengan positional parameter
void sayhello(String name, String message) {
  print('$message, $name!');
}

// Nomer 3-2 - Optional Parameter
void sayhello2(String name, [String? message]) {
  if (message != null) {
    print('$message, $name!');
  } else {
    print('G\'day, $name!');
  }
}

// Nomer 3-3 - Named Parameter
void weaponStats({String? name, int? materialID}){
  print('Weapon Name: $name');
  print('Material ID: $materialID');
}

// Nomer 3-4 - Required Parameter
void printCharName({required String name}){
  print('Character Name: $name');
}

// ====================[ NOMER 4 ]==================== //
// Function sebagai first-class objects
// Nomer 4-2 Fungsi sebagai parameter
void executeFunction(Function myFunction, int randomNumber, String anotherRandomString) {
  print('Random Number: $randomNumber');
  print('Another Random String: $anotherRandomString');
  myFunction();
}
// fungsi untuk 4-2
void windetteQuote() {
  print('I HAVE\'T SEEN THE SUN IN THREE DAYS! - Windette');
}

// Nomer 4-3 return fungsi dari fungsi lain
Function multiply(int faktor) {
  return (int number) => number * faktor;
}