import 'package:http/http.dart' as http;

class AuthService {
  static const String DOMAIN = '167.99.216.74';

  void login(String email, String password) async {
    print('Login function called');
    try {
      print('Try login');
      var url = Uri.https('167.99.216.74', '/login');
      http.Response response = await http.post(
          url,
          body: {
            'email': email,
            'password': password
          });
      if(response.statusCode == 200) {
        print('Login successful');
      } else {
        print('Login failed');
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch(e) {
      print(e.toString());
    }
  }

  void register(String email, String firstName, String prefix, String lastName, String birthDate, String password) async {
    print('Register function called');
    try {
      print('Try register');
      var url = Uri.https('167.99.216.74', '/register');
      http.Response response = await http.post(
          url,
          body: {
            'email': email,
            'firstName': firstName,
            'prefix': prefix,
            'lastName': lastName,
            'birthDate': birthDate,
            'password': password
          });
      if(response.statusCode == 200) {
        print('Register successful');
      } else {
        print('Register failed');
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch(e) {
      print(e.toString());
    }
  }
}