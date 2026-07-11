import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,

            decoration: InputDecoration(
              hintText: "Enter your task",

              prefixIcon: const Icon(Icons.search),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        ElevatedButton(
          onPressed: onAdd,

          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),

          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
