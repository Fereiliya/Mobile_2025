Function counters() {
  var count = 0; 
  return () {
    count++;
    print(count);
  };
}

void main() {
  var counter1 = counters(); 
  // Panggil 'counter1'. 'count' akan diingat.
  counter1(); // 1
  counter1(); // 2
  counter1(); // 3
}