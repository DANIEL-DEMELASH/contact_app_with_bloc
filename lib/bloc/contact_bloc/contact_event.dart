// ignore_for_file: must_be_immutable

part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  ContactEvent();
  @override
  List<Object> props = [];
}

class GetAllContacts extends ContactEvent {}
