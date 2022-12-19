import 'package:flutter/material.dart';
import 'package:surplus/screens/auth_screen/otp.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .050,
              ),
              Center(
                child: SizedBox(
                  height: height * .10,
                  width: width * .70,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: height * .030,
              ),
              const Text(
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                height: height * .05,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OtpScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  child:  Text(
                    '  Sign in  ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: height * 0.020),
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
