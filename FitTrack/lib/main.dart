import 'package:bmi_calculator/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitTrack BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), //Initiated with splash screen
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final wtController = TextEditingController();
  final cmController = TextEditingController();

  String? result;
  var bgColor = const Color(0xFFF6DA80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C7E39),
        title: const Center(
          child: Text(
            "FitTrack BMI Calculator",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF2CAA8),
            ),
          ),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Track Your BMI',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(255, 85, 36,
                        13), // Set the background color of this card
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: wtController,
                            decoration: InputDecoration(
                              labelText: "Enter your weight (in Kgs)",
                              prefixIcon: const Icon(Icons.line_weight),
                              filled: true,
                              fillColor: Color.fromARGB(255, 241, 197, 147),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: cmController,
                            decoration: InputDecoration(
                              labelText: "Enter your height (in cm)",
                              prefixIcon: const Icon(Icons.height),
                              filled: true,
                              fillColor: Color.fromARGB(255, 241, 197, 147),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.trim();
                      var cm = cmController.text.trim();

                      if (wt.isNotEmpty && cm.isNotEmpty) {
                        var iWt = double.parse(wt);
                        var iCm = double.parse(cm);
                        var tM = iCm / 100;

                        var bmi = iWt / (tM * tM);
                        String msg;

                        if (bmi > 25) {
                          msg = "You're Overweight!";
                          bgColor = const Color(0xFFF9BA5B);
                        } else if (bmi < 18) {
                          msg = "You're Underweight!";
                          bgColor = const Color(0xFFEE9C9C);
                        } else {
                          msg = "You're Healthy!";
                          bgColor = const Color(0xFFA8E8AB);
                        }

                        setState(() {
                          result =
                              "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all fields!";
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9C7E39),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Calculate"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      wtController.clear();
                      cmController.clear();
                      setState(() {
                          result = "Welcome to FitTrack BMI Calculator!\nEnter your details above to calculate your BMI.";
                        });

                  },
                   style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9C7E39),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  child: Text('Clear Form'),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(255, 240, 200,
                        163), // Set the background color of this card
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        result ??
                            "Welcome to FitTrack BMI Calculator!\nEnter your details above to calculate your BMI.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: result == null
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color:
                              result == null ? Colors.grey[700] : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
