import 'package:contact_ui/models/contactModel.dart';
import 'package:contact_ui/pages/home_page.dart';
import 'package:contact_ui/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var nameCtr = TextEditingController();
  var surNameCtr = TextEditingController();
  var phoneNumberCtr = TextEditingController();

  @override
  void initState() {
   // phoneNumberCtr.text = '+998'
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xffffffff),
        title: const Text(
          'Add',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff000000)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (nameCtr.text.isNotEmpty &&
                    phoneNumberCtr.text.length == 19) {
                  var newContact = ContactModel(
                      nameCtr.text , surNameCtr.text,
                      phoneNumberCtr.text);
                  contacts.add(newContact);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route route) => false);
                }else{
                  SnackBar(
                    content: const Text('Yay! A SnackBar!'),
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.check,
                color: Color(0xff000000),
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000)),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: nameCtr,
              decoration: InputDecoration(
                  hintText: 'Enter name',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff454545))),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Surname',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000)),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: surNameCtr,
              decoration: InputDecoration(
                  hintText: 'Enter surname',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff454545))),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phone number',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff000000)),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: phoneNumberCtr,
              inputFormatters: <TextInputFormatter>[
                MaskTextInputFormatter(mask: '+998 (##) ###-##-##',
                  filter: { "#": RegExp(r'[0-9]') },
                )
              ],
              keyboardType: TextInputType.phone,

              decoration: InputDecoration(
                  hintText: '+998 _ _  _ _ _  _ _  _ _',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff454545))),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}