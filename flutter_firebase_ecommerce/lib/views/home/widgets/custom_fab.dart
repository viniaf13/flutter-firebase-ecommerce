import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final int counterIndicator;
  final Function() onPressed;

  const CustomFAB(
      {Key? key, this.counterIndicator = 0, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: const Alignment(1.4, -1.5),
        children: [
          FloatingActionButton(
            onPressed: onPressed,
            child: const Icon(Icons.shopping_cart_outlined),
            backgroundColor: Colors.blueAccent,
          ),
          if (counterIndicator > 0)
            Container(
              child: Center(
                child: Text(counterIndicator.toString(),
                    style: const TextStyle(color: Colors.white)),
              ),
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.black.withAlpha(50))
                ],
                borderRadius: BorderRadius.circular(16),
                color: Colors.red[600],
              ),
            ),
        ],
      ),
    );
  }
}
