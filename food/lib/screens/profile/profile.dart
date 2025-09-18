import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeBase,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
            const SizedBox(height: 60),
            // User info
            ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              title: const Text("John Doe",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text("johndoe@example.com"),
            ),

            const SizedBox(height: 20),

            // Options Grid
            ProfileOption(icon: Icons.person, label: "My Orders"),
            ProfileOption(icon: Icons.person, label: "My Profile"),
            ProfileOption(icon: Icons.person, label: "Delivery Address"),
            ProfileOption(icon: Icons.person, label: "Payment Methods"),
            ProfileOption(icon: Icons.person, label: "Contact Support"),
            ProfileOption(icon: Icons.person, label: "Help & FAQs"),
            ProfileOption(icon: Icons.person, label: "Settings"),
            ProfileOption(icon: Icons.person, label: "Logout"),

            
          ],
        ),
      ),
    );
  }
}

// Reusable Profile Option Widget
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileOption({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(icon, size: 30, color: Colors.orange),
                )),
            SizedBox(width: 12),
            Text(label,
                style: GoogleFonts.leagueSpartan(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(color: Colors.white54),
        const SizedBox(height: 15),
      ],
    );
  }
}
