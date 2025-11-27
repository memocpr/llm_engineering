import 'package:flutter/material.dart';
import 'auth_service.dart';

class UpdateUsernamePage extends StatefulWidget {
  const UpdateUsernamePage({super.key});

  @override
  State<UpdateUsernamePage> createState() => _UpdateUsernamePageState();
}

class _UpdateUsernamePageState extends State<UpdateUsernamePage> {
  final _username = TextEditingController();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Username')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _username, decoration: const InputDecoration(labelText: 'New Username')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _auth.updateUsername(_username.text);
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Update Username'),
            ),
          ],
        ),
      ),
    );
  }
}
