import 'package:costum_widgets/costum_widgets.dart';
import 'package:flutter/material.dart';

class CustomButtonExample extends StatefulWidget {
  CustomButtonExample({Key key}) : super(key: key);

  @override
  _CustomButtonExampleState createState() => _CustomButtonExampleState();
}

class _CustomButtonExampleState extends State<CustomButtonExample> {
  Color _green = Colors.green;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Txt(
              'click_message',
              textAlign: TextAlign.center,
            ),
            Txt('DefaultButton'),
            SizedBox(
              height: 16,
            ),
            DefaultButton(
              text: 'Click',
              activeColor: Colors.green,
              builderText: (_){
                return Txt(
                  'builderText',
                  textAlign: TextAlign.center,
                );
              },
              textStyle: (_) =>
                  _.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              onPressed: () {},
            ),
            SizedBox(
              height: 16,
            ),
            Divider(),
            SizedBox(
              height: 16,
            ),
            Txt(
              'CustomProgressButton',
            ),
            SizedBox(
              height: 16,
            ),
            CustomProgressButton(
              isLoading: isLoading,
              border: 16.0,
              ignorePlatform: true,
              textStyle: (_) =>
                  _.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              onPressed: () async {
                setState(() => isLoading = !isLoading);
                await Future.delayed(Duration(seconds: 2));
                setState(() => isLoading = !isLoading);
              },
              value: 'Click',
              activeColor: _green,
            )
          ],
        ),
      ),
    );
  }
}