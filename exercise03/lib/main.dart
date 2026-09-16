import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BusinessCard(),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  Widget contactBox({
    required IconData icon,
    required String text,
  }) {
    return Container(
      height: 32,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal,
            size: 16,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fills the entire application window
        width: double.infinity,
        height: double.infinity,

        color: Colors.teal,

        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile picture
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/dog.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Name
                    const Text(
                      'Nguyen Van Anh',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // Job
                    const Text(
                      'FLUTTER DEVELOPER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Divider
                    Container(
                      width: 60,
                      height: 1,
                      color: Colors.white54,
                    ),

                    const SizedBox(height: 14),

                    // Phone
                    contactBox(
                      icon: Icons.phone,
                      text: '+84 888 101 888',
                    ),

                    // Email
                    contactBox(
                      icon: Icons.email,
                      text: 'user@gmail.com',
                    ),

                    // Website
                    contactBox(
                      icon: Icons.web,
                      text: 'meets.google.com/nguyen-anh',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
