import 'package:flutter/material.dart';
import 'package:foodhub/Widgets/Profile.dart';
import 'package:foodhub/Widgets/password_field.dart';
import 'package:foodhub/Widgets/text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _updateUserProfile(String email) async {
    // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint to update user profile
    final apiUrl = Uri.parse('YOUR_API_ENDPOINT');

    try {
      final response = await http.post(
        apiUrl,
        body: json.encode({'email': email}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Handle success
        print('User profile updated successfully');
      } else {
        // Handle error
        print('Failed to update user profile: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Failed to update user profile: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Profile(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Edit Email",
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: const Color.fromARGB(221, 29, 29, 29),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Email",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15), // Adjust this value as needed
          Text_field(Maintext: "your email"),

          const SizedBox(
            height: 10,
          ),
          const SizedBox(height: 15), // Adjust this value as needed
          Text_field(Maintext: "confirm email"),

          const SizedBox(
            height: 10,
          ),
          // const SizedBox(height: 15), // Adjust this value as needed
          // Text_field(Maintext: "user@gmail.com"),

          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
