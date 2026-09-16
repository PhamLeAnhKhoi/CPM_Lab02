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
      home: RowDemo(),
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  // Creates the three colored boxes
  Widget boxes() {
    return Row(
      children: [
        Container(
          width: 45,
          height: 43,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.black),
          ),
        ),
        Container(
          width: 65,
          height: 68,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.black),
          ),
        ),
        Container(
          width: 45,
          height: 43,
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.black),
          ),
        ),
      ],
    );
  }

  // Creates one example
  Widget alignmentExample(
    String title,
    MainAxisAlignment alignment,
  ) {
    return Column(
      children: [
        // Blue header
        Container(
          height: 45,
          width: double.infinity,
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text(
            'Row Widget',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Yellow Row area
        Container(
          height: 110,
          width: double.infinity,
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: alignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.black),
                ),
              ),
              Container(
                width: 65,
                height: 68,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.black),
                ),
              ),
              Container(
                width: 45,
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.black),
                ),
              ),
            ],
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Widget Demo'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              alignmentExample(
                'mainAxisAlignment: start',
                MainAxisAlignment.start,
              ),
              alignmentExample(
                'mainAxisAlignment: end',
                MainAxisAlignment.end,
              ),
              alignmentExample(
                'mainAxisAlignment: center',
                MainAxisAlignment.center,
              ),
              alignmentExample(
                'mainAxisAlignment: spaceBetween',
                MainAxisAlignment.spaceBetween,
              ),
              alignmentExample(
                'mainAxisAlignment: spaceEvenly',
                MainAxisAlignment.spaceEvenly,
              ),
              alignmentExample(
                'mainAxisAlignment: spaceAround',
                MainAxisAlignment.spaceAround,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
