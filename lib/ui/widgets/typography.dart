import 'package:flutter/material.dart';

class Heading5 extends StatelessWidget {
  final String text;

  const Heading5({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class LargeTitle extends StatelessWidget {
  final String text;

  const LargeTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }
}
