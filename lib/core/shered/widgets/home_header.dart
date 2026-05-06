import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String main_text;
  final String scandry_text;
  final String hint_text;
  final TextEditingController? controller;
  final FocusNode? searchFocusNode;
  HomeHeader({
    Key? key,
    required this.main_text,
    required this.scandry_text,
    required this.hint_text,
    this.controller,
    this.searchFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 30),
      decoration: const BoxDecoration(
        color: Color(0xFF0D6EFD),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            main_text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            scandry_text,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 25),
          TextField(
            controller: controller,
            focusNode: searchFocusNode,
            decoration: InputDecoration(
              hintText: hint_text,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
