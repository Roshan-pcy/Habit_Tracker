import 'package:flutter/material.dart';

class Floatingaction extends StatelessWidget {
  final void Function()? onPressed;
  const Floatingaction({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
