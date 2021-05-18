import 'package:flutter/material.dart';
import 'package:mvvm/model/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard(this.user);
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Padding(
          child: Row(
            children: [
              Container(
                width: 75,
                height: 75,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(image: NetworkImage(user.avatar))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID : " + user.id.toString()),
                  Text("Nama : " + user.firstName + " " + user.lastName),
                  Text("Email : " + user.email)
                ],
              )
            ],
          ),
          padding: EdgeInsets.all(20),
        ));
  }
}
