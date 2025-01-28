import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String login = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Авторизация", style: TextStyle(fontSize: 30))),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Имя пользователя или почта",
                ),
                onChanged: (newValue){
                  setState(() {
                    login = newValue;
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

              ElevatedButton(onPressed: (){
                if(login == "" || password == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Не все поля заполнены")));
                }
                Navigator.pushNamed(context, 'chat');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Вы вошли как $login")));
              },
              child: Text("Войти"))
            ],
          ),
        ),
      ),
    );
  }
}