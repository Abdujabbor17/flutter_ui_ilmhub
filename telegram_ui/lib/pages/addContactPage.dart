import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_ui/models/contactModel.dart';
import 'package:telegram_ui/pages/contactPage.dart';
import 'package:telegram_ui/states.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextFormField(
                  controller: firstNameCtr,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'First name(required)',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide()),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextFormField(
                  controller: lastNameCtr,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Last name(optional)',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      // borderSide: BorderSide()
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 9,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '00 000 00 00',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide()),
                      prefixIcon: SizedBox(
                        width: 85,
                        child: Row(
                          children: [
                            SizedBox(
                                height: 20,
                                width: 40,
                                child: Image.asset('assets/uz-flag.jpg')),
                            SizedBox(
                              width: 5,
                            ),
                            Text('+998'),
                            SizedBox(
                              width: 3,
                            ),
                            // VerticalDivider(thickness: 5,)
                          ],
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (firstNameCtr.text.isNotEmpty) {
                    contacts.add(ContactModel(
                        '${firstNameCtr.text} ${lastNameCtr.text}',
                        true,
                        '000'));
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const ContactPage();
                    }));
                  }
                },
                child: const Text('Create Contact'))
          ],
        ),
      ),
    );
  }
}
