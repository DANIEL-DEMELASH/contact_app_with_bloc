// ignore_for_file: must_be_immutable

part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  ContactEvent();
  @override
  List<Object> props = [];
}

class GetAllContacts extends ContactEvent {}

class UpdateContact extends ContactEvent {
  final int id;
  final Map<String, String> data;

  UpdateContact(this.id, this.data);
}

class DeleteContactById extends ContactEvent {
  final int id;

  DeleteContactById(this.id);
}
