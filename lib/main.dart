import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/bloc/auth/bloc/authentication_bloc.dart';
import 'package:surplus/bloc/auth/bloc/register_bloc_bloc.dart';
import 'package:surplus/bloc/auth/bloc/send_otp_bloc.dart';
import 'package:surplus/bloc/auth/bloc/verify_otp_bloc.dart';
import 'package:surplus/cubit/bottom_bar_cubit.dart';
import 'package:surplus/cubit/cubit/aadhar_image_picker.dart';
import 'package:surplus/cubit/cubit/auth_cubit.dart';
import 'package:surplus/cubit/cubit/image_picker.dart';
import 'package:surplus/cubit/cubit/location_cubit.dart';
import 'package:surplus/repositories.dart/auth_repo.dart';
import 'package:surplus/screens/auth_screen/signin.dart';
import 'package:surplus/screens/auth_screen/signup.dart';
import 'package:surplus/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomBarCubit>(
          create: (context) => BottomBarCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider<SendOtpBloc>(
          create: (context) => SendOtpBloc(
            authRepository: AuthRepositoryImpl(
              authService: AuthService(
                dio: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => VerifyOTPBloc(
            //   authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            authRepository: AuthRepositoryImpl(
              authService: AuthService(
                dio: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => RegisterBlocBloc(
            authRepository: AuthRepositoryImpl(
              authService: AuthService(
                dio: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ImagePickerCubit(),
        ),
        BlocProvider(
          create: (context) => AadharImagePicker(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color.fromRGBO(241, 90, 41, 1),
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color.fromRGBO(241, 90, 41, 1),
            ),

            //primarySwatch: Color.fromRGBO(241, 90, 41, 1),
          ),
          home: SignInScreen()
          //  BlocBuilder<AuthCubit, AuthState>(
          //   buildWhen: (previous, current) {
          //     return previous is AuthInitialState;
          //   },
          //   builder: (context, state) {
          //     if (state is AuthLoggedInState) {
          //       return const HomeScreen();
          //     } else if (state is AuthLoggedOutState) {
          //       return SignInScreen();
          //     } else {
          //       return SignInScreen();
          //     }
          //   },
          // ),
          ),
    );
  }
}
