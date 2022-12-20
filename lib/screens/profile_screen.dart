import 'package:flutter/material.dart';

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
      ),
      body: Column(
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
          Expanded(
            child: GridView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Card();
              },
            ),
          ),
        ],
      ),
    );
  }
}
