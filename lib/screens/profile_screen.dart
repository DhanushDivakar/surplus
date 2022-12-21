import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/screens/auth_screen/signin.dart';

import '../cubit/cubit/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            
            onPressed: (() => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).logOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignInScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Ok',
                          ),
                        ),
                      ],
                    );
                  },
                )),
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),

            //   // BlocProvider.of<AuthCubit>(context).logOut();
            //   // // Navigator.pushReplacement(
            //   // //   context,
            //   // //   MaterialPageRoute(
            //   // //     builder: (context) => SignInScreen(),
            //   // //   ),
            //   // // );
            // },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height * 0.020,
            ),
            Center(
              child: CircleAvatar(
                radius: width * 0.20,
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundImage: const NetworkImage(
                    'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              ),
            ),
            SizedBox(
              height: height * 0.010,
            ),
            Text(
              'Puneet Chauhan',
              style: TextStyle(
                color: Colors.black,
                fontSize: height * 0.030,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: height * 0.060,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_basket_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: width * 0.040,
                    ),
                    Text(
                      'Blessed 12 people so far',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.020,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * 0.010,
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Card();
              },
            ),
          ],
        ),
      ),
    );
  }
}
