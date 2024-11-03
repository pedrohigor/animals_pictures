import 'package:bloc_2/models/app_picture.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.picture});
  AppPicture picture;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      picture.url,
      fit: BoxFit.cover,
    );
  }
}
