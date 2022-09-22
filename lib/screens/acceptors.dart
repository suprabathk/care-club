import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:care_club/components/display_card.dart';

final _firestore = FirebaseFirestore.instance;

class Acceptors extends StatefulWidget {
  const Acceptors({Key? key}) : super(key: key);

  @override
  State<Acceptors> createState() => _AcceptorsState();
}

class _AcceptorsState extends State<Acceptors> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Requesters ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text('Active requests'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Click to request')),
          ),
          const AcceptorStream(),
        ],
      ),
    );
  }
}

class AcceptorStream extends StatelessWidget {
  const AcceptorStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('acceptors').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final acceptors = snapshot.data?.docs;
          List<Widget> acceptorWidgets = [];
          for (var acceptor in acceptors!) {
            acceptorWidgets.add(
              DisplayCard(
                name: acceptor.get('name'),
                gender: acceptor.get('gender'),
                group: acceptor.get('group'),
                object: acceptor.get('object'),
                mail: acceptor.get('mail'),
                number: acceptor.get('number'),
                location: acceptor.get('location'),
                age: acceptor.get('age'),
              ),
            );
          }
          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: acceptorWidgets,
            ),
          );
        } else {
          return const CircularProgressIndicator(
            backgroundColor: Colors.black,
          );
        }
      },
    );
  }
}
