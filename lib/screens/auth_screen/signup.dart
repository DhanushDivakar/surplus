import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surplus/bloc/auth/bloc/details_data_bloc.dart';
import 'package:surplus/bloc/auth/bloc/register_bloc_bloc.dart';
import 'package:surplus/cubit/cubit/aadhar_image_picker.dart';
import 'package:surplus/cubit/cubit/image_picker.dart';
import 'package:surplus/cubit/cubit/location_cubit.dart';
import 'package:surplus/screens/home_screen/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  String? phoneNo;
  SignUpScreen({super.key, this.phoneNo});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final aadharController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  File? _profileImage;
  File? _aadharImage;

  @override
  void initState() {
    BlocProvider.of<LocationCubit>(context).getCurrentPosition();
    if (mounted) {
      var state = context.read<DetailsDataBloc>().state;
      setState(() {
        nameController.text = state.user.name ?? '';
        emailController.text = state.user.email ?? '';
        widget.phoneNo = state.user.phone;
        aadharController.text = state.user.aadhaarNo ?? '';
        _aadharImage = state.user.aadhaarPic;
        _profileImage = state.user.profilePic;
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    aadharController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<RegisterBlocBloc, RegisterBlocState>(
            listener: (context, state) {
              if (state is Registerd) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => route is HomeScreen,
                );
              } else if (state is RegisterFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is Registering) {
                return const CircularProgressIndicator();
              }
              return BlocBuilder<DetailsDataBloc, DetailsDataState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
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
                          BlocBuilder<ImagePickerCubit, String?>(
                            builder: (context, state) {
                              // final imageFile = File(state');
                              // final image = context.read<ImagePickerCubit>().state;
                              // print(image);
                              return Column(
                                children: [
                                  Stack(
                                    children: [
                                      Center(
                                        child: state != null
                                            ? SizedBox(
                                                height: 0.20 * height,
                                                width: 0.35 * width,
                                                child: ClipOval(
                                                  child: Image.file(
                                                    File(state),
                                                    fit: BoxFit.cover,
                                                    //fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(
                                                height: 0.20 * height,
                                                width: 0.35 * width,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    'assets/images/person.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      Positioned(
                                        bottom: 0.010 * height,
                                        right: 0.250 * width,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                50,
                                              ),
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              // BlocProvider.of<Ima>
                                              BlocProvider.of<ImagePickerCubit>(
                                                      context)
                                                  .getImage(
                                                      ImageSource.gallery);
                                              if (state != null) {
                                                final image = context
                                                    .read<ImagePickerCubit>()
                                                    .state;
                                                final file = File('$image');
                                                setState(() {
                                                  _profileImage = file;
                                                });
                                                print('profileimage : $_profileImage');
                                              }
                                              // final image = context
                                              //     .read<ImagePickerCubit>()
                                              //     .state;
                                              //  print(image);
                                            },
                                            icon: Icon(
                                              Icons.mode_edit_outline_rounded,
                                              color: Colors.white,
                                              size: 0.025 * height,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (state == null)
                                    const Text(
                                      'Please pick an image *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    )
                                ],
                              );
                            },
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
                              if (value!.isEmpty) {
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
                              if (value!.isEmpty ||
                                  !value.contains('@') ||
                                  !value.contains('.')) {
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
                            height: height * .030,
                          ),
                          const Text(
                            'Enter Aadhaar Number',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter number';
                              } else {
                                return null;
                              }
                            },
                            controller: aadharController,
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
                            height: height * .020,
                          ),
                          BlocBuilder<AadharImagePicker, String?>(
                            builder: (context, state) {
                              if (state != null) {
                                print(state);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 0.20 * height,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            File(state),
                                            fit: BoxFit.cover,
                                            //fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BlocBuilder<AadharImagePicker, String?>(
                                      builder: (context, state) {
                                        return TextButton(
                                          onPressed: () {
                                            context
                                                .read<AadharImagePicker>()
                                                .resetImage();
                                            if (state != null) {
                                              final image = context
                                                  .read<AadharImagePicker>()
                                                  .state;
                                              final file = File('$image');
                                              setState(() {
                                                _aadharImage = file;
                                              });
                                              print('aadharimage : $_aadharImage');
                                            }
                                          },
                                          child: const Text("Reset Image"),
                                        );
                                      },
                                    )
                                  ],
                                );
                              }
                              return TextButton(
                                onPressed: () {
                                  context
                                      .read<AadharImagePicker>()
                                      .getAadharImage(ImageSource.gallery);
                                },
                                child: const Text('Pick aadhar image '),
                              );
                            },
                          ),
                          SizedBox(
                            height: height * .05,
                          ),
                          Center(
                            child: OutlinedButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                if (formKey.currentState?.validate() == true &&
                                    context.read<ImagePickerCubit>().state !=
                                        null &&
                                    context.read<AadharImagePicker>().state !=
                                        null &&
                                    context
                                            .read<LocationCubit>()
                                            .state
                                            .permission ==
                                        LocationPermission.whileInUse) {
                                          
                                  context.read<DetailsDataBloc>().add(
                                        SubmitDetailsEvent(
                                          user: state.user.copyWith(
                                            phone: widget.phoneNo,
                                            name: nameController.text,
                                            email: emailController.text,
                                            aadhaarNo: aadharController.text,
                                            aadhaarPic: _aadharImage,
                                            profilePic: _profileImage,
                                            lat: context
                                                .read<LocationCubit>()
                                                .state
                                                .location
                                                .latitude
                                                .toString(),
                                            long: context
                                                .read<LocationCubit>()
                                                .state
                                                .location
                                                .longitude
                                                .toString(),
                                            //profilePic: context.read<ImagePickerCubit>().state,
                                          ),
                                        ),
                                      );
                                  //  context.read<RegisterBlocBloc>().add(Register(name:  ))
                                  //   context.read<RegisterBlocBloc>().add(Register(user: state.copyWith() ));

                                  // ignore: use_build_context_synchronously
                                  // BlocProvider.of<AuthCubit>(context)
                                  //     .sendOTP(phoneNumber);
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 1.0,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              child: Text(
                                '  Sign in  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.020),
                              ),
                            ),
                          ),
                          // BlocConsumer<AuthCubit, AuthState>(
                          //   listener: (context, state) {
                          //     if (state is AuthCodeSentState) {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) {
                          //             return OtpScreen(
                          //               // name: nameController.text,
                          //               // email: emailController.text,
                          //               phoneno: phoneNo,
                          //             );
                          //           },
                          //         ),
                          //       );
                          //     }
                          //   },
                          //   builder: (context, state) {
                          //     if (state is AuthLoadingState) {
                          //       return const Center(
                          //         child: CircularProgressIndicator.adaptive(),
                          //       );
                          //     }
                          //     return Center(
                          //       child: OutlinedButton(
                          //         onPressed: () async {
                          //           print(phoneNo);
                          //           String phoneNumber = '+91$phoneNo';
                          //           FocusScope.of(context).unfocus();
                          //           if (formKey.currentState?.validate() == true) {
                          //             // ignore: use_build_context_synchronously
                          //             BlocProvider.of<AuthCubit>(context)
                          //                 .sendOTP(phoneNumber);
                          //           }
                          //         },
                          //         style: OutlinedButton.styleFrom(
                          //           side: BorderSide(
                          //               width: 1.0,
                          //               color: Theme.of(context).colorScheme.primary),
                          //         ),
                          //         child: Text(
                          //           '  Sign in  ',
                          //           style: TextStyle(
                          //               fontWeight: FontWeight.w600,
                          //               fontSize: height * 0.020),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
