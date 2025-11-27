import 'package:flutter/material.dart';
import 'auth_service.dart';

class ProfileWidget extends StatelessWidget {
  final AuthService _auth = AuthService();

  ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return Column(
      children: [
        Text('Email: ${user?.email ?? "Unknown"}'),
        Text('Username: ${user?.displayName ?? "No name"}'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/updateUsername'),
          child: const Text('Edit Username'),
        ),
      ],
    );
  }
}
