import 'package:flutter/material.dart';
import '../components/custom_button.dart'; // Import your custom widget

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: CustomButton(
          label: 'Click Me',
          onPressed: () {
            print('Button Pressed!');
          },
        ),
      ),
    );
  }
}

