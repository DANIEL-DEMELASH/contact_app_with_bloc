// ignore_for_file: must_be_immutable

part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  ContactState();

  @override
  List<Object> props = [];
}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;
  ContactLoaded(this.contacts);
}

class ContactUpdated extends ContactState {
  final bool isUpdated;

  ContactUpdated(this.isUpdated);
}

class ContactDeleted extends ContactState {
  final Contact contact;

  ContactDeleted(this.contact);
}

class ContactError extends ContactState {
  final String error;
  ContactError(this.error);
}
