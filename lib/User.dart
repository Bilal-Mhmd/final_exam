import 'dart:convert';

class User{
  int id;
  String userName ;
  String email;
  String password;

  User({this.id, this.userName, this.email, this.password});

  factory User.fromMap(Map<String, dynamic> data){
    return User(
      id: data['id'],
      userName: data['username'],
      email: data['email'],
      password: data['password'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'id': this.id,
      'pname': this.userName,
      'quantity': this.password,
      'price':this.email,
    };
  }

}