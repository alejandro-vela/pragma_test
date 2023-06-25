import '../../../../global_locator.dart';
import '../../../api/api_repository.dart';
import 'endpoint/cat_endpoint.dart';

abstract class CatRepository {
  Future<Map<String, dynamic>> getCats();
}

class CatRepositoryDefault extends CatRepository {
  final _api = global<APIRepository>();
  @override
  Future<Map<String, dynamic>> getCats() async {
    final endpoint = CatEndpoint();
    final response = await _api.request(endpoint: endpoint);
    return response;
  }
}
