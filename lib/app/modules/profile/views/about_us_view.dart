import 'package:flutter/material.dart';
import 'package:fyp/fypColor.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: ColorFyp.green,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet tortor vel mauris vulputate, sit amet dictum nunc tincidunt. Donec eget metus vel purus placerat tincidunt a sit amet urna. Nulla malesuada, elit ut pharetra tincidunt, quam nibh blandit magna, ac rutrum lacus mi sed nulla. ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Our Vision',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce aliquet tortor vel mauris vulputate, sit amet dictum nunc tincidunt. Donec eget metus vel purus placerat tincidunt a sit amet urna. Nulla malesuada, elit ut pharetra tincidunt, quam nibh blandit magna, ac rutrum lacus mi sed nulla. ',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
