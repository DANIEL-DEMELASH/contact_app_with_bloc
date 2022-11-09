import 'package:contact_app/bloc/contact_bloc/contact_bloc.dart';
import 'package:contact_app/screens/contact_detail_screen.dart';
import 'package:contact_app/screens/create_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/contact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _contactBloc = ContactBloc();

  @override
  void initState() {
    _contactBloc.add(GetAllContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => BlocProvider<ContactBloc>.value(
                      value: _contactBloc, child: const CreateContact()))));
        },
        backgroundColor: const Color(0xff001253),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Contacts'),
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.person),
        backgroundColor: const Color(0xff3E6D9C),
      ),
      body: BlocProvider(
        create: ((context) => _contactBloc),
        child: BlocListener<ContactBloc, ContactState>(
          listener: ((context, state) {}),
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: ((context, state) {
              if (state is ContactInitial || state is ContactLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ContactLoaded) {
                return contactListWidget(state.contacts, context);
              } else if (state is ContactError) {
                return Center(child: Text(state.error));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget contactListWidget(List<Contact> contacts, BuildContext context) {
    if (contacts.isNotEmpty) {
      return ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: contacts.length,
          itemBuilder: ((context, index) {
            final Contact contact = contacts[index];
            return ListTile(
                title: Text(contact.fullName.toString()),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(contact.phoneNumber.toString()),
                ),
                trailing: const Icon(Icons.arrow_right),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => BlocProvider<ContactBloc>.value(
                            value: _contactBloc,
                            child: ContactDetail(contact: contact))))));
          }));
    } else {
      return const Center(
        child: Text('No Contacts Found'),
      );
    }
  }
}
