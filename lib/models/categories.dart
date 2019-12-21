import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color backgroundColor;


  // Positional parameters (with {}). title and backgroundColor can be absent
  // when creating the Category object in memory, unless @required is used.
  // If using named parameters (without {}), you must pass all parameters.
  const Category({
    @required this.id,
    this.title,
    this.backgroundColor = Colors.orange,
  });
}
