import 'package:flutter/material.dart';

class ComingSoonAlert extends StatelessWidget {
  const ComingSoonAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Coming Soon!'),
      content: Text('This feature will be coming soon!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}
