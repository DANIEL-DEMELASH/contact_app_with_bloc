import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../resources/api_repository.dart';
import '../../models/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    final apiRepository = ApiRepository();

    on<GetAllContacts>((event, emit) async {
      try {
        emit(ContactInitial());
        final List<Contact> contacts = await apiRepository.getAllContacts();
        emit(ContactLoaded(contacts));
      } on NetworkError {
        emit(ContactError('failed to fetch data. is your device online?'));
      }
    });

    on<UpdateContact>(
      (event, emit) async {
        try {
          emit(ContactLoading());
          final bool isUpdated =
              await apiRepository.updateContact(event.id, event.data);
          emit(ContactUpdated(isUpdated));
        } on NetworkError {
          emit(ContactError('failed to fetch data. is your device online?'));
        }
      },
    );

    on<DeleteContactById>(
      (event, emit) async {
        try {
          emit(ContactLoading());
          final Contact contact = await apiRepository.deleteContact(event.id);
          emit(ContactDeleted(contact));
        } on NetworkError {
          emit(ContactError('failed to fetch data. is your device online?'));
        }
      },
    );
  }
}
