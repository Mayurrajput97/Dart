void main() {
  List<String> names = ['Mayur', 'Pavan', 'Ulka'];
  List<int> ages = [21, 35, 26];

  print(names);
  names.add('Dvenster');
  names.add('Zenix');

  print(names);
  names.remove('Zenix');
  print(names);

  print('--------------------');

  ages.add(38);
  ages.remove(21);
  print(ages);
}
