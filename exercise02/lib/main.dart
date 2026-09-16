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
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  Widget box(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // First row: A, B, C
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  // A
                  Expanded(
                    child: box(
                      'A',
                      Colors.red.shade300,
                    ),
                  ),

                  // B
                  Expanded(
                    child: box(
                      'B',
                      Colors.red.shade300,
                    ),
                  ),

                  // C expands horizontally
                  Expanded(
                    flex: 2,
                    child: box(
                      'C',
                      Colors.red.shade300,
                    ),
                  ),
                ],
              ),
            ),

            // D
            Expanded(
              flex: 1,
              child: box(
                'D',
                Colors.orange,
              ),
            ),

            // E - twice the height of D
            Expanded(
              flex: 2,
              child: box(
                'E',
                Colors.green.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
