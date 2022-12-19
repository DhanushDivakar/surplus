import 'package:flutter/material.dart';

class AddedScreen extends StatelessWidget {
  const AddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: height * 0.50,
              width: width * 0.40,
              child: Image.asset('assets/images/confirmation.png'),
            ),
            Text(
              'Congratulations!!!',
              style: TextStyle(
                color: Colors.black,
                fontSize: height * 0.030,
              ),
            ),
            Text(
              'You have listed',
              style: TextStyle(
                color: Colors.black,
                fontSize: height * 0.020,
              ),
            ),
            Text(
              'Chicken salad',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: height * 0.020,
              ),
            ),
            Text(
              'as Surplus',
              style: TextStyle(
                color: Colors.black,
                fontSize: height * 0.020,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddedScreen(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    width: 1.0, color: Theme.of(context).colorScheme.primary),
              ),
              child: Text(
                '  Return to home  ',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: height * 0.020),
              ),
            ),
            Row(
              children: [
                Text(
                  'Changed your mind?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.020,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Remove Listing',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: height * 0.020,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
