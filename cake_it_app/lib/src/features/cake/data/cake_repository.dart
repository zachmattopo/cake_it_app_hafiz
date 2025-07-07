import '../domain/cake.dart';
import '../../../api/cake_api.dart';

class CakeRepository {
  final CakeApi api;
  CakeRepository({required this.api});

  Future<List<Cake>> fetchCakes() async {
    final cakeJsonList = await api.fetchCakesJson();
    return cakeJsonList.map((json) => Cake.fromJson(json)).toList();
  }
}
