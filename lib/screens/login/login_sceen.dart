import 'package:ecommerce/screens/login/signup_screeen.dart';
import 'package:ecommerce/screens/splach/splach_screen.dart';
import 'package:ecommerce/service/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<LoginController>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              auth.loading
                  ? const CircularProgressIndicator()
                  : Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await auth.login(
                              email: emailCtrl.text.trim(),
                              password: passCtrl.text.trim(),
                            );

                            if (auth.user != null && mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login successful!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              // Navigate to Home or Dashboard
                            } else if (auth.errorMessage != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(auth.errorMessage!),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return SplashScreen();
                                },
                              ),
                            );
                          },
                          child: const Text("Login"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return SignupScreen();
                                },
                              ),
                            );
                          },
                          child: Text("create a account"),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
