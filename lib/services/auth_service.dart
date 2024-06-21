import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final box = GetStorage();
  static const API_IP = '167.99.216.74';

  Future<bool> login(String email, String password) async {
    print('Login function called');
    try {
      print('Try login');

      var url = Uri.http(API_IP, '/api/login');
      http.Response response = await http.post(
          url,
          body: {
            'email': email,
            'password': password
          });

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(
            jsonDecode(response.body));
        box.write('username', loginResponse.user.name);
        box.write('email', loginResponse.user.email);
        box.write('token', loginResponse.token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> register(String email,
      String username,
      String birthDate,
      String password) async {
    print('Register function called');
    try {
      print('Try register');

      var url = Uri.http(API_IP, '/api/register');
      var body = jsonEncode({
        "name": username,
        "email": email,
        "password": password
      });
      http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      print('wat');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void saveDayData(String date,
      String emotion,
      Map<String, dynamic> experienced,
      double dayScore,
      String notes) async {
    print('saveDayData function called');
    try {
      print('Try save day data');
      var url = Uri.http(API_IP, '/api/data');
      var body = jsonEncode({
        'date': date,
        'name': box.read('username'),
        'emotion': emotion,
        'experienced': jsonEncode(experienced),
        'dayScore': dayScore.toString(),
        'notes': notes,
        'token': box.read('token')
      });

      http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        print('saved successful');
      } else {
        print('save failed');
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<double>> getDayScores() async {
    try {
      print('Try get day scores');
      var url = Uri.http(API_IP, '/api/data/last-five-days');
      var body = jsonEncode({
        'name': box.read('username')
      });

      http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        print('get successful');
        var parsedResponse = jsonDecode(response.body);
        var data = List<Map<String, dynamic>>.from(parsedResponse['data']);
        return getLastFiveDaysScores(data);
      } else {
        print('get failed');
        return [0.0, 0.0, 0.0, 0.0, 0.0];
      }
    } catch (e) {
      print(e.toString());
      return [0.0, 0.0, 0.0, 0.0, 0.0];
    }
  }

  List<double> getLastFiveDaysScores(List<Map<String, dynamic>> data) {
    Map<String, double> dayScoresMap = {};
    Map<String, DateTime> dayTimesMap = {};

    for (var entry in data) {
      DateTime date = DateTime.parse(entry['date']);
      String dayKey = date.toIso8601String().split('T').first;

      if (!dayTimesMap.containsKey(dayKey) || date.isAfter(dayTimesMap[dayKey]!)) {
        dayTimesMap[dayKey] = date;
        dayScoresMap[dayKey] = entry['dayScore'].toDouble() / 10;
      }
    }

    List<double> dayScores = [];
    DateTime today = DateTime.now();
    for (int i = 4; i >= 0; i--) {
      DateTime day = today.subtract(Duration(days: i));
      String dayKey = day.toIso8601String().split('T').first;
      dayScores.add(dayScoresMap[dayKey] ?? 0.0);
    }

    return dayScores;
  }
}

class User {
  int id;
  String name;
  String email;
  String createdAt;
  String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}

class LoginResponse {
  int status;
  String token;
  User user;
  String message;

  LoginResponse({
    required this.status,
    required this.token,
    required this.user,
    required this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] as int,
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      message: json['message'] as String,
    );
  }
}