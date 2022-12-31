import 'package:flutter/material.dart';
import 'package:surplus/screens/chat_screen/new_chat_screen.dart';

class InnerChatScreen extends StatelessWidget {
  const InnerChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'puneet',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        body:  Container(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
             const  NewChatScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
