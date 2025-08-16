
import 'package:flutter/material.dart';
import 'package:vezeeto/features/login/data/model/login_response.dart';

class HomeScreen extends StatelessWidget {
  final LoginResponse data;
  const HomeScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Home Screen${data.userData?.userName ?? 'Guest'}'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
        ),
      ),
    );
  }
}
