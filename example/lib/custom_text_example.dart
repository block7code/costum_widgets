import 'package:costum_widgets/costum_widgets.dart';
import 'package:flutter/material.dart';

class CustomTextExample extends StatefulWidget {
  CustomTextExample({Key key}) : super(key: key);

  @override
  _CustomTextExampleState createState() => _CustomTextExampleState();
}

class _CustomTextExampleState extends State<CustomTextExample> {

  Color _green = Colors.green;
  String value = '';
  String key = '--';

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              child: Txt(
                value,
                textAlign: TextAlign.center,
                textStyle: (_) => TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.underline),
                rich: Rich(
                    key: key,
                    onRichTap: (value) {
                      print('onRichTap: $value');
                      _show(value);
                    },
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.underline)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: false,
              maxLines: null,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: _green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: _green))),
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            (value.isEmpty)
                ? empty
                : TextFormField(
              autofocus: false,
              maxLines: null,
              controller: _controller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: 'Key',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: _green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: _green))),
              onEditingComplete: () {
                setState(() {
                  this.key = _controller.text;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  _show(String message) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Container(
              child: Txt(message),
            ),
          );
        });
  }
}