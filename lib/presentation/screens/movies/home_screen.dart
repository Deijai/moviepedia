import 'package:flutter/material.dart';
import 'package:moviepedia/presentation/widgets/widgets.dart';

//import '../../views/views.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: childView,
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
