import 'package:flutter/material.dart';
import 'auth_service.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final _newPassword = TextEditingController();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Password')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _newPassword, decoration: const InputDecoration(labelText: 'New Password'), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _auth.updatePassword(_newPassword.text);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Update Password'),
            ),
          ],
        ),
      ),
    );
  }
}
