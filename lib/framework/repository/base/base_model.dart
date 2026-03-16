import 'package:flutter/material.dart';

class BaseModel {
  final int id;
  final String title;
  final Icon icon;
  final Widget body;

  BaseModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.body,
  });
}