import 'package:flutter/material.dart';
import 'auth_service.dart';

class LogoutButton extends StatelessWidget {
  final AuthService _auth = AuthService();

  LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () async {
        await _auth.logout();
        if (context.mounted) Navigator.pushReplacementNamed(context, '/login');
      },
    );
  }
}
