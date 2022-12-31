import 'package:flutter/material.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              style: const TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 240, 238, 238),
                  filled: true,
                  border: InputBorder.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {},
              child: const Icon(Icons.send_rounded),
            ),
          )
          // Container(
          //   //color: Theme.of(context).primaryColor,
          //   margin: EdgeInsets.all(20),
          //        // padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(100),
          //             border: Border.all(width: 2, color: Theme.of(context).primaryColor)),
          //   child: IconButton(
          //     color: Colors.white,
          //     onPressed: () {},
          //     icon: Icon(Icons.send),
          //   ),
          // ),
        ],
      ),
    );
  }
}
