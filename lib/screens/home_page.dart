import 'package:care_club/screens/acceptors.dart';
import 'package:care_club/screens/donors.dart';
import 'package:care_club/screens/explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:care_club/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  Icon _themeIcon = const Icon(Icons.light_mode_outlined);
  static final List<Widget> _widgetOptions = <Widget>[
    const Donors(),
    const Acceptors(),
    const Explore(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'CareClub',
                          style: TextStyle(
                            fontFamily: 'PlayFair',
                            fontSize: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              MyApp.themeNotifier.value =
                                  MyApp.themeNotifier.value == ThemeMode.light
                                      ? ThemeMode.dark
                                      : ThemeMode.light;
                              _themeIcon = Icon(
                                  MyApp.themeNotifier.value == ThemeMode.light
                                      ? Icons.dark_mode
                                      : Icons.light_mode);
                            });
                          },
                          child: _themeIcon,
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Divider(color: Colors.white),
                    ListTile(
                      leading: const Icon(Icons.arrow_circle_up_rounded),
                      title: const Text('Donors'),
                      subtitle: const Text('People who are ready to donate'),
                      onTap: () {
                        _onItemTapped(0);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.arrow_circle_down_rounded),
                      title: const Text('Acceptors'),
                      subtitle: const Text('People who are requesting'),
                      onTap: () {
                        _onItemTapped(1);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.explore_outlined),
                      title: const Text('Explore'),
                      subtitle:
                          const Text('All you need to know to get started'),
                      onTap: () {
                        _onItemTapped(2);
                      },
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Made with love ~ S',
                  style: TextStyle(
                    color: MyApp.themeNotifier.value == ThemeMode.dark
                        ? Colors.white12
                        : Colors.black12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'CareClub',
          style: TextStyle(
            fontFamily: 'PlayFair',
            fontSize: 30,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_up_rounded), label: 'Donors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_down_rounded), label: 'Requesters'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Discover'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
