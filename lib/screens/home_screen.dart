import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/cubit/bottom_bar_cubit.dart';
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
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BottomBarCubit, BottomBarState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return const FirstScreen();
            }
            if (state.navbarItem == NavbarItem.add) {
              return const AddScreen();
            }
            if (state.navbarItem == NavbarItem.chat) {
              return const ChatScreen();
            }
            if (state.navbarItem == NavbarItem.profile) {
              return const ProfileScreen();
            }
            return Container();
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomBarCubit, BottomBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              enableFeedback: false,
              currentIndex: state.index,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded), label: 'Home'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.add_box), label: 'Add'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_rounded), label: 'Chat'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<BottomBarCubit>(context)
                      .getBottomBarItem(NavbarItem.home);
                }
                if (index == 1) {
                  BlocProvider.of<BottomBarCubit>(context)
                      .getBottomBarItem(NavbarItem.add);
                }
                if (index == 2) {
                  BlocProvider.of<BottomBarCubit>(context)
                      .getBottomBarItem(NavbarItem.chat);
                }
                if (index == 3) {
                  BlocProvider.of<BottomBarCubit>(context)
                      .getBottomBarItem(NavbarItem.profile);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
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
        physics: const BouncingScrollPhysics(),
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
                        backgroundColor: Theme.of(context).colorScheme.primary,
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     OutlinedButton(
                //       onPressed: () {},
                //       child: Text('Take'),
                //     ),
                //      OutlinedButton(
                //       onPressed: () {},
                //       child: Text('Bless'),
                //     ),

                //   ],
                // ),
                // Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
