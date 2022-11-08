import 'dart:convert';

import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  String baseUrl = 'https://contact-app-by-dani.herokuapp.com';
  late http.Response response;

  Future<List<Contact>> getAllContacts() async {
    try {
      response = await http.get(
        Uri.parse('$baseUrl/contacts'),
      );
      List<Contact> contacts = (jsonDecode(response.body) as List)
          .map((e) => Contact.fromJson(e))
          .toList();
      return contacts;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
