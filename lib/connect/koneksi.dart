import 'package:get/get_connect.dart';

class Koneksi extends GetConnect {
  Future<Response> kirim(String path, Map<dynamic, String> body) =>
      post(path, body);
}
