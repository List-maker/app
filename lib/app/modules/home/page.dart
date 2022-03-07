import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list/app/modules/hello/controller.dart';

class HelloPage extends GetView<HelloController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Container(
            child: GetX<HelloController>(
              initState: (state) {},
              builder: (context) {
                return Column(
                  children: <Widget>[
                    Spacer(),
                    Text(context.title),
                    Text(context.count.toString()),
                    InkWell(
                      onTap: () {
                        context.increment();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Center(child: Text("+")),
                        color: Colors.green,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.decrement();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Center(child: Text("-")),
                        color: Colors.red,
                      ),
                    ),
                    Spacer(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
