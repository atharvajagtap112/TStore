import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IcecreamView extends StatelessWidget {
  const IcecreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Icecreams")),
      ),
    );
  }
}