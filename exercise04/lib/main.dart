import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF303030),
      ),
      home: const BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  // Current values
  String gender = 'FEMALE';
  int height = 169;
  int weight = 67;
  int age = 28;

  double bmi = 0;

  // Calculate BMI
  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  // Reusable button
  Widget customButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xFF505050),
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  // Reusable +/- button
  Widget roundButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF505050),
          ),
        ),
        child: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }

  // Weight / Age component
  Widget valueSelector({
    required String label,
    required int value,
    required VoidCallback decrease,
    required VoidCallback increase,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF505050),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                roundButton(
                  icon: Icons.arrow_downward,
                  onPressed: decrease,
                ),
                const SizedBox(width: 5),
                roundButton(
                  icon: Icons.arrow_upward,
                  onPressed: increase,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GFC Custom Widget',
          style: TextStyle(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF303030),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            // --------------------------------
            // GENDER
            // --------------------------------
            Row(
              children: [
                customButton(
                  text: 'FEMALE',
                  onPressed: () {
                    setState(() {
                      gender = 'FEMALE';
                    });
                  },
                ),
                customButton(
                  text: 'MALE',
                  onPressed: () {
                    setState(() {
                      gender = 'MALE';
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 3),

            // --------------------------------
            // HEIGHT
            // --------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF505050),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text(
                    'HEIGHT $height cm',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    divisions: 120,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 3),

            // --------------------------------
            // WEIGHT + AGE
            // --------------------------------
            Row(
              children: [
                valueSelector(
                  label: 'WEIGHT',
                  value: weight,
                  decrease: () {
                    setState(() {
                      if (weight > 1) {
                        weight--;
                      }
                    });
                  },
                  increase: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                valueSelector(
                  label: 'AGE',
                  value: age,
                  decrease: () {
                    setState(() {
                      if (age > 1) {
                        age--;
                      }
                    });
                  },
                  increase: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 3),

            // --------------------------------
            // CLEAR + GET BMI
            // --------------------------------
            Row(
              children: [
                customButton(
                  text: 'CLEAR',
                  onPressed: () {
                    setState(() {
                      gender = 'FEMALE';
                      height = 169;
                      weight = 67;
                      age = 28;
                      bmi = 0;
                    });
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: ElevatedButton(
                      onPressed: calculateBMI,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.green,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      child: const Text(
                        'GET BMI',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // --------------------------------
            // RESULT
            // --------------------------------
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF505050),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: bmi == 0
                      ? const SizedBox()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'BMI',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              bmi.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
