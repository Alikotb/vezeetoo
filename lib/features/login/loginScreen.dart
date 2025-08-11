
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login Screen',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
