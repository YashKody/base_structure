import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class HomeController extends ChangeNotifier {

} 

final ChangeNotifierProvider <HomeController> HomeControllerProvider = 
ChangeNotifierProvider<HomeController>((ref) => HomeController());