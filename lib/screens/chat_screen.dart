// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat/nQKx3oO8Ns3toiaOeu1b/message')
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircleAvatar(),
            );
          }
          final documnets = snapshot.data!.docs;
          return ListView.builder(
              itemCount: documnets.length,
              // ignore: avoid_unnecessary_containers
              itemBuilder: (ctx, index) => Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(documnets[index]['text']),
                  ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chat/nQKx3oO8Ns3toiaOeu1b/message')
              .add({'text': 'This was added by plus button'});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
