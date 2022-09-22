import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DisplayCard extends StatelessWidget {
  late final String name;
  late final String object;
  late final String age;
  late final String location;
  late final String group;
  late final String gender;
  late final String number;
  late final String mail;

  DisplayCard({
    Key? key,
    required this.name,
    required this.gender,
    required this.group,
    required this.object,
    required this.mail,
    required this.number,
    required this.location,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(object, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Blood Group: $group',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Location: $location',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Number: $number',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Name: $name'),
            Text('Age: $age'),
            Text('Gender: $gender'),
            Text('Mail ID: $mail'),
          ],
        ),
      ),
    );
  }
}
