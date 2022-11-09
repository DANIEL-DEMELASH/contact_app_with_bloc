import 'package:contact_app/models/contact.dart';

import 'api_provider.dart';

class ApiRepository {
  final _apiProvider = ApiProvider();

  Future<List<Contact>> getAllContacts() {
    return _apiProvider.getAllContacts();
  }

  Future<bool> updateContact(int id, Map<String, String> data) {
    return _apiProvider.updateContact(id, data);
  }

  Future<Contact> deleteContact(int id) {
    return _apiProvider.deleteContact(id);
  }
}

class NetworkError extends Error {}
