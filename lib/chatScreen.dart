import 'package:flutter/material.dart';
import 'package:flutter_chat/Message.dart';
import 'package:flutter_chat/User.dart';
import 'package:socket_io_client_flutter/socket_io_client_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  User currentUser = User("pararam2006", "email@example.com", "huihuihui");
  String inputValue = "";
  List<Message> msgList = [
    Message("Это пример сообщения.", "Тут будет юзернейм"),
    Message("А это второй пример сообщения, с текстом побольше.", "pararam2006")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Чат", style: TextStyle(fontSize: 30))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: msgList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            msgList[index].from,
                            style: TextStyle(fontSize: 25),
                            overflow: TextOverflow.ellipsis
                        ),
                        Text(
                            msgList[index].text,
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.visible,
                            maxLines: null
                        ),
                      ],
                    ),
                  ),
                );
              }
            )
          ),
          Center(
            child: SizedBox(
              height: 120,
              width: 380,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Написать сообщение...",
                      ),
                      onChanged: (newValue){
                        setState(() {
                          inputValue = newValue;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        Message msg = Message(inputValue, currentUser.userName);
                        msgList.add(msg);
                        inputValue = "";
                      });
                    },
                    icon: Icon(Icons.send, size: 20,)
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
