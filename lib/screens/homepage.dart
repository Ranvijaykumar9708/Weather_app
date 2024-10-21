import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E335A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E335A),
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.white),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            // Shadow effect for the entire TextField
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7), // Shadow color
                blurRadius: 10, // Blur effect of the shadow
                spreadRadius: 2, // How much the shadow spreads
                offset: const Offset(0, 3), // Shadow position (x, y)
              ),
            ],
            borderRadius: BorderRadius.circular(22),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 19),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white70,
                size: 28, // Adjust the icon size if needed
              ),
              hintText: "Search City, Places",
              hintStyle: const TextStyle(color: Colors.white60),
              filled: true,
              fillColor: const Color(0xFF3B3C58),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide.none, // Remove the default border
              ),
            ),
            style: const TextStyle(color: Colors.white), // Text color
            cursorColor: Colors.white, // Cursor color
          ),
        ),
      ),
    );
  }
}
