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
        if (contacts[0].error != null) {
          emit(ContactError(contacts[0].error.toString()));
        }
      } on NetworkError {
        emit(ContactError('failed to fetch data. is your device online?'));
      }
    });
  }
}
