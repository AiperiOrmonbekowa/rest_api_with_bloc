import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rest_api_with_bloc/models/user_model.dart';
import '../constants/api.const.dart';

class HomeService {
  const HomeService(this.client);
  final http.Client client;
  Future<List<User>?> getUsers() async {
    try {
      final uri = Uri.parse(ApiConst.users);
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = fromStringList(response.body);
        return data;
      } else {
        log('${response.statusCode}');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

final homeService = HomeService(http.Client());
