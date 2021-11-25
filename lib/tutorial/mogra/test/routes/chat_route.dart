import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  String userName;
  String message;
  Chat(this.userName, this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Center(child: Text(message)),
      backgroundColor: Colors.cyan,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.photo),
              onPressed: () => {},
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Aa',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mic),
              onPressed: () => {},
            ),
          ],
        ),
      ),

    );
  }
}
