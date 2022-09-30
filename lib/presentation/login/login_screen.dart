import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/login/login_cubit.dart';
import 'package:aggregator/data/repositories/user_repository.dart';
import 'package:aggregator/presentation/registration/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: const RouteSettings(name: routeName));
  }

  static Page<void> page() => const MaterialPage<void>(child: LoginScreen());

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Авторизация",
          style: GoogleFonts.manrope(
              textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<UserRepository>(), context.read<AuthBloc>()),
        child: Center(
          child: SingleChildScrollView(
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Не удалось войти."),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  // Text fields
                  Container(
                    color: whiteColor,
                    child: Column(
                      children: [
                        // Email field
                        TextFormField(
                          controller: _emailController,
                          textAlignVertical: TextAlignVertical.center,
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(fontSize: 16, color: Colors.black)
                          ),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Логин или почта',
                            hintStyle: GoogleFonts.manrope(
                              textStyle: TextStyle(fontSize: 16, color: hintColor)
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),

                        // Password field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          textAlignVertical: TextAlignVertical.center,
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(fontSize: 16, color: Colors.black)
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'Пароль',
                            hintStyle: GoogleFonts.manrope(
                              textStyle: TextStyle(fontSize: 16, color: hintColor)
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Login Button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) => previous.loginStatus != current.loginStatus,
                      builder: (context, state) {
                        return state.loginStatus == LoginStatus.submitting
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                context.read<LoginCubit>().login(_emailController.text, _passwordController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: purpleColor,
                                minimumSize: const Size.fromHeight(64),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text(
                                "Войти",
                                style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700)
                                ),
                              )
                            );
                      },
                    ),
                  ),

                  const SizedBox(height: 19),

                  // Go to Registration Page Button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, RegistrationScreen.route());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleColor,
                        minimumSize: const Size.fromHeight(64),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        "Зарегистрироваться",
                        style: GoogleFonts.manrope(
                          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
