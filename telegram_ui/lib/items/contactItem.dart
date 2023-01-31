import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_ui/models/contactModel.dart';

Widget contactItem(BuildContext context, ContactModel contact) {
  return Container(
    padding: EdgeInsets.all(7),
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: contact.image == null
                ? ColoredBox(
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      contact.name[0],
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  )
                : Image.asset(
                    contact.image!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.name),
            const SizedBox(
              height: 8,
            ),
            Text(
              contact.isOnline ? 'online' : 'last seen ${contact.lastSeenTime}',
              style: TextStyle(
                  color: contact.isOnline ? Colors.blue : Colors.black87),
            ),
          ],
        )
      ],
    ),
  );
}
