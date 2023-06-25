import '../../../../api/endpoint.dart';

class CatEndpoint extends Endpoint {
  CatEndpoint();

  @override
  Method get method => Method.get;

  @override
  String get path => 'v1/breeds';
}
