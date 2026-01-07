void main(List<String> args) {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'nama': 'Afrizal Qurratul Faizin',
    'nim': 2341720083
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon', 
    18: 2, 
    'nama': 'Afrizal Qurratul Faizin', 
    'nim': 2341720083};

  var mhs1 = Map<String, String>();
  
  //Modifikasi elemen
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  
  //Menambah elemen
  mhs1['nama'] = 'Afrizal Qurratul Faizin';
  mhs1['nim'] = '2341720083';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  //Menambah elemen
  mhs2[998] = 'Afrizal Qurratul Faizin';
  mhs2[999] = '2341720083';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
