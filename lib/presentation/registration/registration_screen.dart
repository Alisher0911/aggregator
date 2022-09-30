import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/register/register_cubit.dart';
import 'package:aggregator/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registration';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const RegistrationScreen(),
      settings: const RouteSettings(name: routeName)
    );
  }

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _togglePassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(context.read<UserRepository>(), context.read<AuthBloc>()),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Регистрация",
            style: GoogleFonts.manrope(
              textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
            ),          
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            )
          ),
        ),
        body: SafeArea(
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state.registerStatus == RegisterStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Не удалось создать аккаунт."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text fields
                    Container(
                      color: whiteColor,
                      child: Column(
                        children: [
                          // Login field
                          TextFormField(
                            controller: _loginController,
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(fontSize: 16, color: Colors.black)
                            ),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Логин',
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Поле не может быть пустым';
                              }
                              return null;
                            },
                          ),
                            
                          const Divider(
                            height: 1,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                            
                          // Phone field 
                          TextFormField(
                            controller: _phoneController,
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(fontSize: 16, color: Colors.black)
                            ),
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Телефон',
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Поле не может быть пустым';
                              }
                              if (value.length < 11) {
                                return 'Поле должен состоять минимум из 11 символов';
                              }
                              return null;
                            },
                          ),
                            
                          const Divider(
                            height: 1,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                            
                          // Email field  
                          TextFormField(
                            controller: _emailController,
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(fontSize: 16, color: Colors.black)
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Почта',
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Поле не может быть пустым';
                              }
                              var regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");
                              if (!regExp.hasMatch(_emailController.text)) {
                                return 'Введите корректный e-mail';
                              }
                              return null;
                            },
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
                            obscureText: _isHidden,
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
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: InkWell(
                                  onTap: _togglePassword,
                                  child: Icon(
                                    _isHidden ? Icons.visibility_off : Icons.visibility,
                                    color: const Color(0xFF17191F),
                                    size: 25,
                                  ),
                                ),
                              )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Поле не может быть пустым';
                              }
                              if (value.length < 8) {
                                return 'Пароль должен состоять минимум из 8 символов';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          // Registration Button
          child: BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) => previous.registerStatus != current.registerStatus,
            builder: (context, state) {
              return state.registerStatus == RegisterStatus.submitting
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<RegisterCubit>().register(_emailController.text, _loginController.text, _phoneController.text, _passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      minimumSize: const Size.fromHeight(64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Создать аккаунт",
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
                      ),
                    )
                  );
            },
          ),
        ),
      ),
    );
  }
}