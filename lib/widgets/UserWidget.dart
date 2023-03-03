import 'package:flutter/material.dart';

import '../model/User.dart';

class UserWidget extends StatelessWidget {
  User user;

  UserWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableText(user.name),
        SizedBox(height: 5),
        SelectableText('@${user.username}'),
      ],
    );
  }
}
