import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int _category = 0;

  List<Widget> categories = [
    const BloodDonation(),
    const OrganDonation(),
    const BoneMarrow(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Discover',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _category = 0;
                        });
                      },
                      child: const Text('Blood donation'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _category = 1;
                        });
                      },
                      child: const Text('Organ donation'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _category = 2;
                        });
                      },
                      child: const Text('Bone Marrow'),
                    ),
                  ),
                ],
              ),
            ),
            categories.elementAt(_category),
          ],
        ),
      ),
    );
  }
}

class BloodDonation extends StatelessWidget {
  const BloodDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Donating blood is an excellent way to serve the community as both the donor and the receiver will reap health benefits.\n',
          style: TextStyle(fontSize: 20),
        ),
        Image.asset(
          'images/blooddonor.jpg',
        ),
        const Text(
          '\nThe blood donation process from the time you arrive until the time you leave takes about an hour. The donation itself is only about 8-10 minutes on average.',
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          '\nSteps to register for donation: \n1.Donor fills up the registration form\n2.Gives his consent for donation',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class OrganDonation extends StatelessWidget {
  const OrganDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Organ donation is the process when a person allows an organ of their own to be removed and transplanted to another person, legally, either by consent while the donor is alive or dead with the assent of the next of kin.\n',
          style: TextStyle(fontSize: 20),
        ),
        Image.asset(
          'images/organdonor.jpg',
        ),
        const Text(
          '\nOne donor alone can save or drastically improve the lives of eight or more people, and donations don\'t always have to occur postmortem.',
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          '\nSteps for organ donation\n1. Registration of donor\n2. Death of a registered donor\n3. Evaluation of the donor\n4. Family authorization acquired\n5. Medical maintenance of the donor\n6. Organs matched to recipients',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class BoneMarrow extends StatelessWidget {
  const BoneMarrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'A bone marrow transplant replaces diseased bone marrow with healthy tissue, usually stem cells found in the blood. That’s why bone marrow transplants are also called stem cell transplants.\n',
          style: TextStyle(fontSize: 20),
        ),
        Image.asset(
          'images/bonemarrow.jpg',
        ),
        const Text(
          '\nOnly about 30% of people who need a transplant can find an HLA-matched donor in their immediate family.For the remaining 70% of people, doctors need to find HLA-matched bone marrow from other donors',
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          '\nSteps for bone marrow transplant\n1.Collect bone marrow from Donor\n2.Destroy the existing bone marrow of patient\n3.Infusion of bone marrow through intravenous routes',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
