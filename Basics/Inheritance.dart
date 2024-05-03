void main() {
  User user1 = User('Mayur', 21);

  print(user1.age);
  print(user1.username);
  user1.login();

  print('--------------------');

  User user2 = User('Pavan', 32);
  print(user2.age);
  print(user2.username);
  user2.login();
  print('---------------------');

  SuperUser user3 = SuperUser('Zenix', 20);
  print(user3.username);
  print(user3.age);
  user3.just();
}

class User {
  String username;
  int age;

  User(this.username, this.age) {}

  void login() {
    print('You are logined into the System');
  }
}

class SuperUser extends User {
  SuperUser(String username, int age) : super(username, age);

  void just() {
    print('Hehe There!');
  }
}
