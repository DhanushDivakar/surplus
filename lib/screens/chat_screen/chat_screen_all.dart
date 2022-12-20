import 'package:flutter/material.dart';
import 'package:surplus/screens/chat_screen/inner_chat.dart';
import 'package:surplus/screens/home_screen/inner_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => InnerChatScreen() )));
                    
                  },
                  leading: CircleAvatar(
                    radius: width * 0.060,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundImage: const NetworkImage(
                        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  title: const Text(
                    'puneet',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Thank you!! That was very helpful'),
                ),
                Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
