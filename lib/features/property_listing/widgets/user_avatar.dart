import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.black),
          ),
          Positioned(
              top: 12,
              right: -2,
              child: Container(
                height: 14,
                width: 18,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                child: const Text(''),
              ))
        ],
      ),
    );
  }
}
