import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const baseUrl = "http://api.openweathermap.org/data/2.5/weather";
  final String apiKey;
  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
        Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric&lang=en'));

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    //get user permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //convert the location into a list of placemark objects
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //extraxt the city name from the first placemark
    String? city = placemarks[0].locality;
    return city ?? "";
  }
}
