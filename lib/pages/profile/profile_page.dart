import 'package:flutter/material.dart';
import 'package:flutter_medical_ui/pages/started.dart';
import 'package:flutter_medical_ui/pages/profile/profile_data_page.dart';
import 'package:flutter_medical_ui/pages/profile/payment_method_page.dart';
import 'package:flutter_medical_ui/pages/profile/history_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileDataPage()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/rian.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rian El Brianne',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '2311500090@mahasiswa.atmaluhur.ac.id',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _buildProfileSection('Personal Information'),
            _buildProfileItem(Icons.person, 'Profile Data', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileDataPage(),
                ),
              );
            }),
            _buildProfileItem(Icons.credit_card, 'Payment Methods', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentMethodPage(),
                ),
              );
            }),
            _buildProfileItem(Icons.history, 'History', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            }),
            _buildProfileItem(Icons.logout, 'Logout', () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartedPage(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            }, isLogout: true),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.green),
      title: Text(
        title,
        style: TextStyle(color: isLogout ? Colors.red : Colors.black),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
