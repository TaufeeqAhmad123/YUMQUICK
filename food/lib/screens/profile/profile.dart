import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
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
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                ProfileOption(icon: Icons.shopping_bag, label: "My Orders"),
                ProfileOption(icon: Icons.person, label: "My Profile"),
                ProfileOption(icon: Icons.notifications, label: "Notifications"),
                ProfileOption(icon: Icons.settings, label: "Settings"),
                ProfileOption(icon: Icons.help, label: "Support"),
                ProfileOption(icon: Icons.star, label: "Reviews"),
              ],
            ),
          ),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text("Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onPressed: () {
                // handle logout
              },
            ),
          )
        ],
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.orange),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
