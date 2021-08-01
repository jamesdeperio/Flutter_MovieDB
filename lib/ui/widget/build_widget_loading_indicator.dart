import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildWidgetLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Platform.isAndroid
        ? CircularProgressIndicator()
        : CupertinoActivityIndicator());
  }

}