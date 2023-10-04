import 'package:dio/dio.dart';

class LoginController {
  Future<void> sendData(phone, password) async {
    try {
      var response = await Dio()
          .post("https://thimar.amr.aait-d.com/api/client_register", data: {
        "phone":  phone,
        "password": password,
      });
    } on DioException catch (e) {
      print(e.toString());
    }
  }
}
