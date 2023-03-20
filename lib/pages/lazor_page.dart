import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_appiontment/components/lazor_body.dart';

class LazorPage extends StatefulWidget {
  const LazorPage({Key? key}) : super(key: key);

  @override
  State<LazorPage> createState() => _LazorPageState();
}

class _LazorPageState extends State<LazorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LazorBody(),
    );
  }
}
