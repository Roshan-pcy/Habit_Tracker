import 'package:flutter/material.dart';

class Showdailogue extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSaved;
  final Function() onCancel;
  const Showdailogue(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      ),
      backgroundColor: Colors.grey[800],
      content: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.white),
          ),
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
      actions: [
        MaterialButton(
          color: Colors.black,
          textColor: Colors.white,
          onPressed: onCancel,
          child: const Text('cancel'),
        ),
        MaterialButton(
          color: Colors.black,
          textColor: Colors.white,
          onPressed: onSaved,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
