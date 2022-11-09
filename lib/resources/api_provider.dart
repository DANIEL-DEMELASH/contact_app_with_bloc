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

  Future<bool> updateContact(int id, Map<String, String> data) async {
    try {
      response = await http.put(Uri.parse('$baseUrl/contactById/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'full_name': data['full_name'] ?? '',
            'nick_name': data['nick_name'] ?? '',
            'job': data['job'] ?? '',
            'phone_number': data['phone_number'] ?? '',
            'email': data['email'] ?? '',
            'telegram': data['telegram'] ?? '',
            'linked_in': data['linked_in'] ?? '',
            'github': data['github'] ?? '',
            'twitter': data['twitter'] ?? '',
          }));
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<Contact> deleteContact(int id) async {
    try {
      response = await http.delete(
        Uri.parse('$baseUrl/contactById/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return Contact.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<Contact> newContact(Map<String, String> data) async {
    try {
      response = await http.post(Uri.parse('$baseUrl/new_contact'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'full_name': data['full_name'] ?? '',
            'nick_name': data['nick_name'] ?? '',
            'job': data['job'] ?? '',
            'phone_number': data['phone_number'] ?? '',
            'email': data['email'] ?? '',
            'telegram': data['telegram'] ?? '',
            'linked_in': data['linked_in'] ?? '',
            'github': data['github'] ?? '',
            'twitter': data['twitter'] ?? '',
          }));
      return Contact.fromJson(jsonDecode(response.body));
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
