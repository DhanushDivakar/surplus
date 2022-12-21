import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/cubit/cubit/auth_cubit.dart';
import 'package:surplus/screens/home_screen/home_screen.dart';

class OtpScreen extends StatelessWidget {
  final String? name;
  final String? email;
  final String? phoneno;
  OtpScreen({super.key, this.name, this.email, this.phoneno});
  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                'Enter otp',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: otpController,
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
              ),
              SizedBox(
                height: height * .05,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedInState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                    );
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return Center(
                    child: OutlinedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc()
                            .set({
                          'phoneNumber': phoneno,
                          'userName': name,
                          'email': email,
                          'time': DateTime.now(),
                        });

                        // ignore: use_build_context_synchronously
                        BlocProvider.of<AuthCubit>(context)
                            .verifyOTP(otpController.text);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      child: Text(
                        '  Continue  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.020),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SigninOtp extends StatelessWidget {
  SigninOtp({
    super.key,
  });
  final TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                'Enter otp',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: otpController,
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
              ),
              SizedBox(
                height: height * .05,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedInState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      ),
                    );
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return Center(
                    child: OutlinedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        // ignore: use_build_context_synchronously
                        BlocProvider.of<AuthCubit>(context)
                            .verifyOTP(otpController.text);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      child: Text(
                        '  Continue  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.020),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
