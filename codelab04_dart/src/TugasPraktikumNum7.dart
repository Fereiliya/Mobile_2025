// Multiple value
(String, String, String, int) makeCharInfo(String name, String riskLevel, String origin, int qlipothCount) {
  return (name, riskLevel, origin, qlipothCount);
}

void main(List<String> args) {
  List<String> roseliaMember = ['Yukina Minato', 'Lisa Imai', 'Rinko Shirokane', 'Sayo Hikawa', 'Ako Udagawa'];
  List<String> riskLevel = ['Zayin', 'Teth', 'He', 'Vav', 'Aleph'];
  List<String> origin = ['Bandori', 'Earth', 'Multiversal'];

  // Destructuring / Mapping
  var (name, level, org, qlipoth) = makeCharInfo(roseliaMember[0], riskLevel[4], origin[0], 3);
  var mapInfo = makeCharInfo(roseliaMember[0], riskLevel[4], origin[0], 3);
  //Print WHOLE map
  print(mapInfo);
  // Individual
  print("=======================");
  print('Character Name: $name');
  print('Risk Level: $level');
  print('Origin: $org');
  print('Qlipoth Count: $qlipoth');
}

