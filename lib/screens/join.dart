import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ParentFunctionCallback = void Function(int index);

class Join extends StatefulWidget {
  const Join(this.exit);

  final ParentFunctionCallback exit;

  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey[200],
        child: Center(
          child: TextButton(
            child: Text('Join'),
            onPressed: () => widget.exit(2),
          ),
        ),
      ),
    );
  }
}
