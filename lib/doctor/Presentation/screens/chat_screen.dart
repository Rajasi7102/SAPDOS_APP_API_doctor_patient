

import 'package:doctor_and_patient_appication/utils/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAPDOS ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ChatApp(),
    );
  }
}

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final _messageController = TextEditingController();
  List<ChatMessage> _messages = [];

  void _handleSendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          text: _messageController.text,
          isSender: true,
        ));
        _messageController.clear();
      });
      _simulateResponse();
    }
  }

  void _simulateResponse() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _messages.add(ChatMessage(
          text: 'Hello! Sir/Mam',
          isSender: false,
        ));
      });
    });
  //   Timer(Duration(seconds: 4), () {
  //   setState(() {
  //     _messages.add(ChatMessage(
  //       text: 'Can You Please Tell Me Your Name?',
  //       isSender: false,
  //     ));
  //   });
  // });
  Timer(Duration(seconds: 4), () {
    setState(() {
      _messages.add(ChatMessage(
        text: 'What seems to be the problem today?',
        isSender: false,
      ));
    });
  });
      Timer(Duration(seconds: 6), () {
    setState(() {
      _messages.add(ChatMessage(
        text: 'Can you please provide more details about your symptoms?',
        isSender: false,
      ));
    });
  });
      Timer(Duration(seconds: 30), () {
    setState(() {
      _messages.add(ChatMessage(
        text: 'I\'ve reviewed your information, and I\'d like to schedule a follow-up appointment to discuss further.',
        isSender: false,
      ));
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sapdos Chat App',
        style:TextStyle(color: Colors.black,backgroundColor: AppColors.secondary)
        
        ),
      ),
      body: Center( 
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatMessageWidget(_messages[index]);
                },
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder( 
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: 'Type a message...',
                        hintStyle:TextStyle(color: Colors.black)
                      
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor:AppColors.secondary,
                  elevation: 5, 
                   ),
                    onPressed: _handleSendMessage,
                  child: Text('Send'),
                )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Contacts',

          
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSender;

  ChatMessage({required this.text, required this.isSender});
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: message.isSender
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: message.isSender ? Color.fromARGB(255, 162, 202, 235) : Color.fromARGB(158, 163, 69, 69),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: message.isSender ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}