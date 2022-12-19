import 'package:costum_widgets/costum_widgets.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  ExamplePage({Key key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
//  PRIMARY SETTINGS
  bool _settings = false;
  bool _title = true;
  bool _delete = false;
  bool _creditCard = false;

//  CHECKED ITEMS
  bool _fileDownload = false;
  bool _attachMoney = true;
  bool _trendingUp = true;

//  COLORS
  Color _grey300 = Colors.grey[300];
  Color _green = Colors.green;
  Color _green50 = Colors.green[50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            _bodyTitle(title: 'Settings', size: 25),
            SizedBox(
              height: 16,
            ),
            _bodyTitle(title: 'PRIMARY SETTINGS'),
            SizedBox(
              height: 16,
            ),
            _itemSwitch(
                value: _settings,
                icon: Icons.settings,
                title: 'Setting option disabled',
                description: 'Describle here what it is for',
                onChanged: (value) {
                  setState(() {
                    _settings = value;
                  });
                }),
            _itemSwitch(
                value: _title,
                icon: Icons.title,
                title: 'Automatically text alignment',
                description: 'This is unuseful experimental feature',
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                }),
            _itemSwitch(
                value: _delete,
                icon: Icons.delete,
                title: 'Automatically delete items',
                description: 'Get rid of sh*t and keep working hard',
                onChanged: (value) {
                  setState(() {
                    _delete = value;
                  });
                }),
            _itemSwitch(
                value: _creditCard,
                icon: Icons.credit_card,
                title: 'Keep my financial information',
                description: 'No more privacy on the web',
                onChanged: (value) {
                  setState(() {
                    _creditCard = value;
                  });
                }),
            SizedBox(
              height: 50,
            ),
            _bodyTitle(title: 'CHECKED ITEMS'),
            SizedBox(
              height: 16,
            ),
            _itemCheck(
                value: _fileDownload,
                icon: Icons.file_download,
                description: 'Available for download',
                onChanged: (value) {
                  setState(() {
                    _fileDownload = value;
                  });
                }),
            _itemCheck(
                value: _attachMoney,
                icon: Icons.attach_money,
                description: 'For commercial projects',
                onChanged: (value) {
                  setState(() {
                    _attachMoney = value;
                  });
                }),
            _itemCheck(
                value: _trendingUp,
                icon: Icons.trending_up,
                description: 'Accelerate design flow',
                onChanged: (value) {
                  setState(() {
                    _trendingUp = value;
                  });
                }),
          ],
        ),
      ),
    );
  }

  _bodyTitle({String title, double size = 12}) {
    return Text(
      title,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  _itemCheck(
      {IconData icon,
      String description,
      bool value = false,
      ValueChanged<bool> onChanged}) {
    return Container(
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
        trailing: _customCheck(value: value, onChanged: onChanged),
      ),
    );
  }

  _itemSwitch(
      {IconData icon,
      String description,
      String title,
      bool value = false,
      ValueChanged<bool> onChanged}) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: (value) ? _green50 : Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
              width: 1.0, color: (value) ? Colors.transparent : _grey300)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 8,
          ),
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          _customSwitch(value: value, onChanged: onChanged)
        ],
      ),
    );
  }

  _customCheck({bool value, ValueChanged<bool> onChanged}) {
    return CustomCheck(
      value: value,
      activeColor: _green,
      type: CheckType.circle,
      size: 24,
      sizePoint: 18,
      onChanged: onChanged,
    );
  }

  _customSwitch({bool value, ValueChanged<bool> onChanged}) {
    return CustomSwitch(
      value: value,
      activeColor: Colors.green,
      pointColor: Colors.white,
      onChanged: onChanged,
    );
  }
}
