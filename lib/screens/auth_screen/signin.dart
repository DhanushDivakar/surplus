import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/bloc/auth/bloc/send_otp_bloc.dart';
import 'package:surplus/screens/auth_screen/otp.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final phoneNumberController = TextEditingController();
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
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length != 10) {
                      return 'Enter correct number';
                    } else {
                      return null;
                    }
                  },
                  controller: phoneNumberController,
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
              BlocConsumer<SendOtpBloc, SendOtpState>(
                listener: (context, state) {
                  if (state is SendOtpSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SigninOtp();
                        },
                      ),
                    );
                  } else if (state is SendOtpFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SendingOtp) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return Center(
                    child: OutlinedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (formKey.currentState?.validate() == true) {
                          context.read<SendOtpBloc>().add(
                                SendOtpEvent(
                                  phone: phoneNumberController.text,
                                ),
                              );
                          //   CollectionReference collectionRef =
                          //       FirebaseFirestore.instance.collection('users');
                          //   QuerySnapshot querySnapshot = await collectionRef
                          //       .where('phoneNumber',
                          //           isEqualTo: phoneNumberController.text)
                          //       .get();
                          //   final allData = querySnapshot.docs
                          //       .map((doc) => doc.data())
                          //       .toList();
                          //   if (allData.isEmpty) {
                          //     // ignore: avoid_print
                          //     print('new user');
                          //     // ignore: use_build_context_synchronously
                          //     Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) {
                          //           return SignUpScreen(
                          //             phoneNo: phoneNumberController.text,
                          //           );
                          //         },
                          //       ),
                          //     );
                          //   } else {
                          //     String phoneNumber =
                          //         '+91${phoneNumberController.text}';
                          //     // ignore: use_build_context_synchronously
                          //     BlocProvider.of<AuthCubit>(context)
                          //         .sendOTP(phoneNumber);
                          //   }
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
    );
  }
}
