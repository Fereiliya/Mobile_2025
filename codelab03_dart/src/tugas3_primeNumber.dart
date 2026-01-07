void main() {
  int number = 0;
  int totalPrime = 0;
  //Loop 0 to 201, look for prime number
  for (var i = 0; i < 201; i++) {
    bool isPrime = true;
    //Check  prime di loop inner
    for (var j = 2; j <= i / 2; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      print("Prime Found: " + i.toString() + " - Afrizal Qurratul Faizin - 2341720083"); 
      totalPrime++;
    }
  }

  print("Total of Primes: " + totalPrime.toString());
}