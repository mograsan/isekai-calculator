import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'routes/chat_route.dart';

class Tile extends StatelessWidget {
  IconData icon;
  String userName;
  String message;

  Tile(this.icon, this.userName, this.message);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '削除',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading:CircleAvatar(
            child: Icon(icon),
            backgroundColor: Colors.pink,
          ),
          title: Text(userName),
          subtitle: Text(message),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Chat(userName, message)
                )
            )
          },
        ),
      ),
    );
  }
}