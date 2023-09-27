import 'package:flutter/material.dart';
import 'package:gym_app/services/auth_service.dart';
import 'package:gym_app/shared/decoration_input.dart';
import 'package:gym_app/shared/my_colors.dart';
import 'package:gym_app/widgets/my_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.blueTopGradiente,
                  MyColors.blueDownGradiente,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/gym-logo.png", height: 128),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInput("Email"),
                        validator: (String? value) {
                          if (value == null) {
                            return "E-mail não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "E-mail é muito curto";
                          }
                          if (!value.contains("@")) {
                            return "Informe um email válido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        decoration: getAuthenticationInput("Password"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazio";
                          }
                          if (value.length < 5) {
                            return "A senha é muito curto";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !isLogin,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  getAuthenticationInput("Repeat the password"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A senha não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "A senha é muito curto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _nameController,
                              decoration: getAuthenticationInput("Full name"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 5) {
                                  return "O nome é muito curto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () => handleSignButton(),
                          child: Text(isLogin ? "Entrar" : "Cadastrar")),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(isLogin
                            ? "Ainda não tem uma conta? cadastre-se"
                            : "Já tem uma conta? Faça o login"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  handleSignButton() {
    if (_formKey.currentState!.validate()) {
      if (isLogin) {
        _authService
            .loginUser(
                email: _emailController.text,
                password: _passwordController.text)
            .then((String? error) {
          if (error != null) {
            showSnackBar(context: context, text: error);
          }
        });
      } else {
        _authService
            .signUpUser(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
        )
            .then((String? error) {
          if (error != null) {
            showSnackBar(context: context, text: error);
          }
        });
      }
    } else {}
  }
}
