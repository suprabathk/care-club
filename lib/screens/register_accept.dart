import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class AInfo extends StatefulWidget {
  const AInfo({Key? key}) : super(key: key);

  @override
  State<AInfo> createState() => _AInfoState();
}

class _AInfoState extends State<AInfo> {
  void registerBase() {
    _firestore.collection('acceptors').add({
      'name': name,
      'object': object,
      'age': age,
      'location': location,
      'group': group,
      'gender': gender,
      'number': number,
      'mail': mail,
    });
  }

  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final numberController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();

  late String name;
  late String object = 'Blood';
  late String age;
  late String location;
  late String group = 'A+';
  late String gender = 'Female';
  late String number;
  late String mail;

  List<String> donList = ['Blood', 'Organs', 'Bone Marrow'];
  List<String> bgList = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  List<String> gList = ['Male', 'Female'];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    mailController.dispose();
    numberController.dispose();
    ageController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Register to Accept: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  labelText: 'Full name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                controller: nameController,
                onChanged: (String? newValue) {
                  setState(() {
                    name = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Mail',
                  labelText: 'Mail ID',
                  border: OutlineInputBorder(),
                ),
                controller: mailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (String? newValue) {
                  setState(() {
                    mail = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Number',
                  labelText: 'Number',
                  border: OutlineInputBorder(),
                ),
                controller: numberController,
                keyboardType: TextInputType.number,
                onChanged: (String? newValue) {
                  setState(() {
                    number = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Age',
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                controller: ageController,
                keyboardType: TextInputType.number,
                onChanged: (String? newValue) {
                  setState(() {
                    age = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Location',
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                controller: locationController,
                onChanged: (String? newValue) {
                  setState(() {
                    location = newValue!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Request: '),
                  DropdownButton(
                    hint: const Text('Donation: '),
                    value: object,
                    items: donList.map((String items0) {
                      return DropdownMenuItem(
                        value: items0,
                        child: Text(items0),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        object = newValue!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Blood Group: '),
                  DropdownButton(
                    value: group,
                    items: bgList.map((String items0) {
                      return DropdownMenuItem(
                        value: items0,
                        child: Text(items0),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        group = newValue!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Gender: '),
                  DropdownButton(
                    value: gender,
                    items: gList.map((String items0) {
                      return DropdownMenuItem(
                        value: items0,
                        child: Text(items0),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        registerBase();
                        Navigator.pop(context);
                      },
                      child: const Text('Submit')))
            ],
          ),
        ),
      ),
    );
  }
}
