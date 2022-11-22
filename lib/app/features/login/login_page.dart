import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errormessage = '';
  var isCreatingAccount = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccount == true
                  ? 'Zarejestruj się'
                  : 'Zaloguj się'),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(hintText: 'E-mail'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: widget.passwordController,
                decoration: const InputDecoration(hintText: 'Hasło'),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(errormessage),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errormessage = error.toString();
                      });
                    }
                  } else {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                      );
                    } catch (error) {
                      setState(() {
                        errormessage = error.toString();
                      });
                    }
                  }
                },
                child: Text(isCreatingAccount == true
                    ? 'Zarejestruj się'
                    : 'Zaloguj się'),
              ),
              const SizedBox(
                height: 20,
              ),
              if (isCreatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        isCreatingAccount = true;
                      },
                    );
                  },
                  child: const Text('Utwórz konto'),
                )
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        isCreatingAccount = false;
                      },
                    );
                  },
                  child: const Text('Masz już konto?'),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
