import 'dart:convert';
import 'package:http/http.dart' as http;

class CakeApi {
  static const _cakesUrl =
      "https://gist.githubusercontent.com/hart88/79a65d27f52cbb74db7df1d200c4212b/raw/ebf57198c7490e42581508f4f40da88b16d784ba/cakeList";

  Future<List<Map<String, dynamic>>> fetchCakesJson() async {
    final url = Uri.parse(_cakesUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = json.decode(response.body);
      return decodedResponse.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load cakes');
    }
  }
}
