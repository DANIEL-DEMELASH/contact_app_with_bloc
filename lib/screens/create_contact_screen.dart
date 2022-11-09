import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc/contact_bloc.dart';
import 'home_screen.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  final _fullName = TextEditingController();
  final _nickName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _email = TextEditingController();
  final _telegram = TextEditingController();
  final _linkedIn = TextEditingController();
  final _github = TextEditingController();
  final _twitter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
        builder: ((context, state) {
          if (state is ContactCreated) {
            return const HomeScreen();
          } else if (state is ContactLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ContactError) {
            return Center(
              child: Text(state.error),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('New Contact'),
              elevation: 0,
              centerTitle: true,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MaterialButton(
                onPressed: () {
                  Map<String, String> data = {
                    'full_name': _fullName.text.trim(),
                    'nick_name': _nickName.text.trim(),
                    'phone_number': _phoneNumber.text.trim(),
                    'email': _email.text.trim(),
                    'telegram': _telegram.text.trim(),
                    'linked_in': _linkedIn.text.trim(),
                    'github': _github.text.trim(),
                    'twitter': _twitter.text.trim(),
                  };

                  BlocProvider.of<ContactBloc>(context).add(NewContact(data));
                },
                color: Colors.lime,
                child: const Text('Save'),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: const Text(
                                'Full name:',
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: const Text(
                                'Nick name:',
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _fullName,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _nickName,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/linkedin.png',
                      height: 25,
                    ),
                    TextField(
                      controller: _linkedIn,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/gmail.png',
                      height: 25,
                    ),
                    TextField(
                      controller: _email,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                'assets/github.png',
                                height: 25,
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                'assets/phone-call.png',
                                height: 20,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _github,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _phoneNumber,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                'assets/telegram.png',
                                height: 25,
                              )),
                        ),
                        Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                'assets/twitter.png',
                                height: 20,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _telegram,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _twitter,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        listener: ((context, state) {}));
  }
}
