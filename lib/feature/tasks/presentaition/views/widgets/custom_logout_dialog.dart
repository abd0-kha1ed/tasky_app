import 'package:flutter/material.dart';

class CustomLogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const CustomLogoutDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Logout Confirmation",
          style: TextStyle(fontWeight: FontWeight.bold)),
      content: const Text("Are you sure you want to log out?"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("cancel", style: TextStyle(color: Colors.grey)),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text("logout", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
