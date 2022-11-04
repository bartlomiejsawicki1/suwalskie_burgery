import 'package:flutter/material.dart';

import 'firebase_options.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Jesteś niezalogowany'),
      ),
    );
  }
}
