import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailScreen extends GetView {
  const MovieDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Movie Detail')), body: Center(child: Text('Movie Detail Screen')));
  }
}
