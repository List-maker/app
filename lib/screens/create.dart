import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ParentFunctionCallback = void Function(int index);

class Create extends StatefulWidget {
  const Create(this.exit);

  final ParentFunctionCallback exit;

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey[200],
        child: Center(
          child: TextButton(
            child: Text('Create'),
            onPressed: () => widget.exit(2),
          ),
        ),
      ),
    );
  }
}
