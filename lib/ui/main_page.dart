import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/bloc/user_bloc.dart';
import 'package:mvvm/model/user.dart';
import 'package:mvvm/ui/user_card.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("MVVM"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
                child: Text("Pick"),
                onPressed: () {
                  bloc.add(random.nextInt(10) + 1);
                }),
            BlocBuilder<UserBloc, User>(
                builder: (context, user) =>
                    (user is UninitializedUser) ? Container() : UserCard(user))
          ],
        ));
  }
}
