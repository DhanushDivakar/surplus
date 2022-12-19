import 'package:flutter/material.dart';
import 'package:surplus/screens/added_screen.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              const Text(
                'Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(230, 230, 230, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(230, 230, 230, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Pick Image',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: height * 0.020),
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              const Spacer(),
              Center(
                child: Text(
                  'all done? please click submit',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: height * 0.020),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
              SizedBox(
                height: height * 0.050,
                width: double.infinity,
                child: ElevatedButton(
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
                        width: 1.0,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  child: Text(
                    '  Submit  ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: height * 0.020),
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
