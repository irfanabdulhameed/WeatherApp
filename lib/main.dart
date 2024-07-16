import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  // await dotenv.load(fileName: ".env");
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

  Future<void> _requestPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      fetchWeatherData();
    } else {
      // Handle the case where the user denied the permission
      setState(() {
        _isLoading = false;
        _location = 'Permission Denied';
        _description = 'N/A';
        _temp = 0.0;
        _lottieAnimation = 'assets/loading.json';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1e1e1e),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 40,
                      color: Color(0xFFe5e5e5),
                    ),
                    Text(
                      _location,
                      style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'norwester',
                          color: Color(0xFFe5e5e5)),
                    ),
                    const SizedBox(height: 80),

                    // Lottie animation representing the weather
                    Lottie.asset(
                      _lottieAnimation,
                      width: 300,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 100),
                    Text(
                      '${_temp.toInt()}°C',
                      style: const TextStyle(
                          fontSize: 50,
                          fontFamily: 'norwester',
                          color: Color(0xFFe5e5e5)),
                    ),
                    Text(
                      _description,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'norwester',
                          color: Color(0xFFe5e5e5)),
                    ),
                    // SizedBox(height: 16),
                  ],
                ),
              ),
      ),
    );
  }
}
