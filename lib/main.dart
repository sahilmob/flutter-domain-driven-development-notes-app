import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:ddd/injection.dart';
import 'package:ddd/presentation/core/app_widget.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(App());
}
