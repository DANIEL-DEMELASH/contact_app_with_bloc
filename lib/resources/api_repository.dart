import 'package:contact_app/models/contact.dart';

import 'api_provider.dart';

class ApiRepository {
  final _apiProvider = ApiProvider();

  Future<List<Contact>> getAllContacts() async {
    return await _apiProvider.getAllContacts();
  }
}

class NetworkError extends Error {}
