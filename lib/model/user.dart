import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }

  static Future<User> getUserFromAPI(int id) async {
    String url = "https://reqres.in/api/users/" + id.toString();
    var result = await http.get(Uri.parse(url));
    var jsonObject = json.decode(result.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    print(userData);
    return User.fromJson(userData);
  }
}

class UninitializedUser extends User {}
