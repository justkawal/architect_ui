import 'package:flutter/material.dart';

class ArchitectModel {
  String imageUrl, name, description, price;

  ArchitectModel(
      {@required this.imageUrl,
      @required this.name,
      @required this.description,
      @required this.price});
}

List<ArchitectModel> listModel = [
  ArchitectModel(
      imageUrl: "kitchen.png",
      name: "Kitchen 1",
      description: "The furniture from quality designed houses.",
      price: "\$4,800"),
  ArchitectModel(
      imageUrl: "office.png",
      name: "Office 1",
      description: "Highest level of refinement and comfort.",
      price: "\$4,800"),
  ArchitectModel(
      imageUrl: "land.png",
      name: "Land 1",
      description: "The land from the heaven.",
      price: "\$4,800"),
];
