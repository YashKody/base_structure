import 'package:base_structure/framework/repository/base/base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class BaseController extends ChangeNotifier{
  List <BaseModel> screens = [];
}

final ChangeNotifierProvider <BaseController> baseControllerProvider = 
ChangeNotifierProvider<BaseController>((ref) => BaseController());