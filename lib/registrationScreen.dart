import 'package:flutter/material.dart';
import 'package:flutter_chat/Message.dart';
import 'package:flutter_chat/User.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String userName = "";
  String email = "";
  String password = "";
  String repeatedPassword = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Регистрация", style: TextStyle(fontSize: 30))),
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Имя пользователя",
                ),
                onChanged: (newValue){
                  setState(() {
                    userName = newValue;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Электронная почта",
                ),
                onChanged: (newValue){
                  setState(() {
                    email = newValue;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Пароль",
                ),
                onChanged: (newValue){
                  setState(() {
                    password = newValue;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Повторите пароль",
                ),
                onChanged: (newValue){
                  setState(() {
                    repeatedPassword = newValue;
                  });
                },
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  if(userName == "" || email == "" || password == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Не все поля заполнены")));
                  } else if(repeatedPassword != password){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Пароли не совпадают")));
                  } else {
                    User user = User(userName, email, password);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Вы зарегистрированы как ${user.userName}")));
                    Navigator.pushNamed(context, 'auth');
                  }
                });
              }, child: Text("Зарегистрироваться"))
            ],
          ),
        ),
      ),
    );
  }
}