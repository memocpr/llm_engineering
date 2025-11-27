import 'package:flutter/material.dart';
import 'auth_service.dart';

class DeleteAccountPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Account')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _auth.deleteAccount();
            if (context.mounted) Navigator.pushReplacementNamed(context, '/login');
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Delete My Account'),
        ),
      ),
    );
  }
}
