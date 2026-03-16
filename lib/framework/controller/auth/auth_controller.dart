import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthController extends ChangeNotifier {

}

final ChangeNotifierProvider <AuthController> authControllerProvider = 
ChangeNotifierProvider<AuthController>((ref) => AuthController());