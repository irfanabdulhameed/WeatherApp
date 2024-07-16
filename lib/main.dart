// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLoading = true;
//   late String _location;
//   late String _description;
//   late double _temp;

//   Future<void> fetchWeatherData() async {
//     final position = await Geolocator.getCurrentPosition();
//     final url =
//         'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=6872f7db5a3adf54825b495cce446619';
//     final res = await get(Uri.parse(url));
//     final data = jsonDecode(res.body);
//     setState(() {
//       _isLoading = false;
//       _location = data['name'];
//       _temp = data['main']['temp'] - 273;
//       _description = data['weather'][0]['main'];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchWeatherData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: _isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   Text(
//                     '${_temp.toInt()}°C',
//                   ),
//                   Text(_description),
//                   Text(_location),
//                 ],
//               ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLoading = true;
//   late String _location;
//   late String _description;
//   late double _temp;

//   Future<void> fetchWeatherData() async {
//     final position = await Geolocator.getCurrentPosition();
//     final url =
//         'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=6872f7db5a3adf54825b495cce446619';
//     final res = await get(Uri.parse(url));
//     final data = jsonDecode(res.body);
//     setState(() {
//       _isLoading = false;
//       _location = data['name'];
//       _temp = data['main']['temp'] - 273;
//       _description = data['weather'][0]['main'];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchWeatherData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: _isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '${_temp.toInt()}°C',
//                       style: TextStyle(fontSize: 48),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       _description,
//                       style: TextStyle(fontSize: 24),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       _location,
//                       style: TextStyle(fontSize: 24),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart';
// import 'package:lottie/lottie.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isLoading = true;
//   late String _location;
//   late String _description;
//   late double _temp;
//   late String _lottieAnimation;

//   Future<void> fetchWeatherData() async {
//     final position = await Geolocator.getCurrentPosition();
//     final url =
//         'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=6872f7db5a3adf54825b495cce446619';
//     final res = await get(Uri.parse(url));
//     final data = jsonDecode(res.body);

//     // Determine the appropriate Lottie animation based on the weather description
// String getLottieAnimation(String description) {
//   switch (description.toLowerCase()) {
//     case 'clear':
//       return 'assets/sunny.json';
//     case 'clouds':
//       return 'assets/cloudy.json';
//     case 'rain':
//       return 'assets/rainy.json';
//     case 'mist':
//       return 'assets/mist.json';
//     default:
//       return 'assets/sunny.json';
//   }
// }

//     setState(() {
//       _isLoading = false;
//       _location = data['name'];
//       _temp = data['main']['temp'] - 273;
//       _description = data['weather'][0]['main'];
//       _lottieAnimation = getLottieAnimation(_description);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchWeatherData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: _isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Lottie animation representing the weather
//                     Lottie.asset(
//                       _lottieAnimation,
//                       width: 150,
//                       height: 150,
//                       fit: BoxFit.fill,
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       '${_temp.toInt()}°C',
//                       style: TextStyle(fontSize: 48),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       _description,
//                       style: TextStyle(fontSize: 24),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       _location,
//                       style: TextStyle(fontSize: 24),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  String _location = 'Unknown';
  String _description = 'Unknown';
  double _temp = 0.0;
  String _lottieAnimation = 'assets/loading.json';

  Future<void> fetchWeatherData() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=6872f7db5a3adf54825b495cce446619';
      final res = await get(Uri.parse(url));
      final data = jsonDecode(res.body);

      // Determine the appropriate Lottie animation based on the weather description
      String getLottieAnimation(String description) {
        switch (description.toLowerCase()) {
          case 'clear':
            return 'assets/sunny.json';
          case 'clouds':
            return 'assets/cloudy.json';
          case 'rain':
            return 'assets/rainy.json';
          case 'mist':
            return 'assets/mist.json';
          default:
            return 'assets/loading.json';
        }
      }

      setState(() {
        _isLoading = false;
        _location = data['name'];
        _temp = data['main']['temp'] - 273;
        _description = data['weather'][0]['main'];
        _lottieAnimation = getLottieAnimation(_description);
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Lottie animation representing the weather
                    Lottie.asset(
                      _lottieAnimation,
                      width: 250,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                    // const SizedBox(height: 16),
                    Text(
                      '${_temp.toInt()}°C',
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'auraFont',
                          color: Color(0xFF323232)),
                    ),
                    // SizedBox(height: 16),
                    Text(
                      _location,
                      style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'auraFont',
                          color: Color(0xFF323232)),
                    ),
                    Text(
                      _description,
                      style:
                          const TextStyle(fontSize: 24, fontFamily: 'auraFont'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
