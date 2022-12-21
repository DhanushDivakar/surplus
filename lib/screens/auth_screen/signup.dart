import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/cubit/cubit/auth_cubit.dart';
import 'package:surplus/screens/auth_screen/otp.dart';

class SignUpScreen extends StatelessWidget {
  final String phoneNo;
  SignUpScreen({super.key, required this.phoneNo});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .010,
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
                Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: width * 0.20,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundImage: const NetworkImage(
                            'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                    ),
                   Positioned(
                  bottom: 5,
                  right: 120,
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:const  BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                    child: IconButton(
                      onPressed:(){},
                      icon: const Icon(
                        
                        Icons.mode_edit_outline_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                  ],
                ),
                SizedBox(
                  height: height * .030,
                ),
                const Text(
                  'Enter Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Enter correct name';
                    } else {
                      return null;
                    }
                  },
                  controller: nameController,
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
                  height: height * .030,
                ),
                const Text(
                  'Enter Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Enter correct email';
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthCodeSentState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OtpScreen(
                              name: nameController.text,
                              email: emailController.text,
                              phoneno: phoneNo,
                            );
                          },
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
                          print(phoneNo);
                          String phoneNumber = '+91$phoneNo';
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState?.validate() == true) {
                            // ignore: use_build_context_synchronously
                            BlocProvider.of<AuthCubit>(context)
                                .sendOTP(phoneNumber);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 1.0,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        child: Text(
                          '  Sign in  ',
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
      ),
    );
  }
}
