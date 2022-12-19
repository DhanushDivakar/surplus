import 'package:flutter/material.dart';
import 'package:surplus/screens/add_screen.dart';
import 'package:surplus/screens/chat_screen.dart';
import 'package:surplus/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final List<Widget> _widgetOptions = [
    //   HomeScreen(),
    //   AddScreen(),
    //   ChatScreen(),
    //   ProfileScreen(),
    // ];
    // int _selectedIndex = 0;

    // void onItemtapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 120,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      CircleAvatar(
                        radius: width * 0.050,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: CircleAvatar(
                          radius: width * 0.045,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundImage: const NetworkImage(
                              'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      Text(
                        'Butter chicken',
                        style: TextStyle(
                            fontSize: height * 0.020,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: height * .25,
                      width: double.infinity,
                      child: Image.network(
                        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.),
                          Text(
                            '3.2 Km',
                            style: TextStyle(
                                fontSize: height * .030,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Text(
                        '12:47',
                        style: TextStyle(fontSize: height * .030),
                      ),
                    ],
                  ),
                  // Divider()
                ],
              ),
            );
          },
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home_max_rounded),
        //       label: ''
              
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.plus_one_rounded),
        //       label: ''
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.chat_bubble_outline_rounded),
        //       label: ''
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person_off_outlined),
        //       label: ''
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Theme.of(context).colorScheme.primary,
        //   onTap: onItemtapped,
        // ),
      ),
    );
  }
}
