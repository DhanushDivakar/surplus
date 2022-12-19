import 'package:flutter/material.dart';

class InnerScreen extends StatelessWidget {
  const InnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: const Text(
            'Chicken salad',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.30,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Text(
                '5.3 Km away',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.020),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Text(
                'Chicken salad for 2 ppl',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.025),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Text(
                'Chicken Salad is great, it is so cool that you will literally die if you taste it. OMG when i first had it, i was like ummm hmmm...',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.020),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: height * 0.050,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'connect',
                    style: TextStyle(fontSize: height * 0.025),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
