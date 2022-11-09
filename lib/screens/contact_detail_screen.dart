import 'package:contact_app/bloc/contact_bloc/contact_bloc.dart';
import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({super.key, required this.contact});
  final Contact contact;

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  final _fullName = TextEditingController();
  final _nickName = TextEditingController();
  final _job = TextEditingController();
  final _sex = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _email = TextEditingController();
  final _telegram = TextEditingController();
  final _linkedIn = TextEditingController();
  final _github = TextEditingController();
  final _twitter = TextEditingController();
  final _street = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _country = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    _fullName.text = widget.contact.fullName ?? '';
    _nickName.text = widget.contact.nickName ?? '';
    _job.text = widget.contact.job ?? '';
    _sex.text = widget.contact.sex ?? '';
    _phoneNumber.text = widget.contact.phoneNumber ?? '';
    _email.text = widget.contact.email ?? '';
    _telegram.text = widget.contact.telegram ?? '';
    _linkedIn.text = widget.contact.linkedIn ?? '';
    _github.text = widget.contact.github ?? '';
    _twitter.text = widget.contact.twitter ?? '';
    _street.text = widget.contact.address?.street ?? '';
    _city.text = widget.contact.address?.city ?? '';
    _state.text = widget.contact.address?.state ?? '';
    _country.text = widget.contact.address?.country ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
        builder: ((context, state) {
          if (state is ContactUpdated) {
            if (state.isUpdated) {
              return const HomeScreen();
            } else {
              Fluttertoast.showToast(msg: 'failed to update contact');
            }
          } else if (state is ContactDeleted) {
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
              title: const Text('Contact Info'),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<ContactBloc>(context)
                          .add(DeleteContactById(widget.contact.id!));
                    },
                    icon: const Icon(
                      Icons.delete,
                    ))
              ],
            ),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            isEnabled = true;
                            FocusScope.of(context).requestFocus(nameFocusNode);
                          });
                        },
                        color: Colors.yellow,
                        child: const Text('Edit'),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Map<String, String> data = {
                            'full_name': _fullName.text.trim(),
                            'nick_name': _nickName.text.trim(),
                            'job': _job.text.trim(),
                            'phone_number': _phoneNumber.text.trim(),
                            'email': _email.text.trim(),
                            'telegram': _telegram.text.trim(),
                            'linked_in': _linkedIn.text.trim(),
                            'github': _github.text.trim(),
                            'twitter': _twitter.text.trim(),
                          };

                          BlocProvider.of<ContactBloc>(context)
                              .add(UpdateContact(widget.contact.id!, data));
                        },
                        color: Colors.lime,
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                )),
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
                            enabled: isEnabled,
                            focusNode: nameFocusNode,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _nickName,
                            textAlign: TextAlign.center,
                            enabled: isEnabled,
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
                      enabled: isEnabled,
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
                      enabled: isEnabled,
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
                            enabled: isEnabled,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _phoneNumber,
                            textAlign: TextAlign.center,
                            enabled: isEnabled,
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
                            enabled: isEnabled,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _twitter,
                            textAlign: TextAlign.center,
                            enabled: isEnabled,
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
