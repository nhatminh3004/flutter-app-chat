class User {
  //khai bao thuoc tinh
  //late nghĩa là gán giá trị sau đó
   int id;
   String name;
//ham Contrucstor
  User(this.id, this.name);
  @override
  String toString() {
    // TODO: implement toString
    return 'my ID:$id and my name:$name';
  }
}
