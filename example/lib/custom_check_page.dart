import 'package:costum_widgets/costum_widgets.dart';
import 'package:flutter/material.dart';

class CustomCheckPage extends StatefulWidget {
  CustomCheckPage({Key key}) : super(key: key);

  @override
  _CustomCheckPageState createState() => _CustomCheckPageState();
}

class _CustomCheckPageState extends State<CustomCheckPage> {
//  CHECKED ITEMS
  bool _file_download = false;
  bool _attach_money = true;
  bool _trending_up = true;

  CheckType type = CheckType.custom;

  double _sizePoint = 18.0;

  double _sizeCheck = 24.0;

  double _border = 4.0;

//  CHECK TYPE
  static const types = <String>['custom', 'circle'];

  final List<DropdownMenuItem<String>> _dropTypes = types
      .map((e) => DropdownMenuItem<String>(
            value: '${e}',
            child: Text('${e}'),
          ))
      .toList();

  //  POINTS
  static const points = <String>['default', 'star', 'like'];

  IconData _point;

  String _pointString = 'default';

  final List<DropdownMenuItem<String>> _points = points
      .map((e) => DropdownMenuItem<String>(
            value: '${e}',
            child: Text('${e}'),
          ))
      .toList();

//  COLORS
  Color _green = Colors.green;
  Color _green50 = Colors.green[50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            _Title(title: 'CHECKED ITEMS'),
            SizedBox(
              height: 16,
            ),
            _ItemCheck(
                value: _file_download,
                icon: Icons.file_download,
                description: 'Available for download',
                onChanged: (value) {
                  setState(() {
                    _file_download = value;
                  });
                }),
            _ItemCheck(
                value: _attach_money,
                icon: Icons.attach_money,
                description: 'For commercial projects',
                onChanged: (value) {
                  setState(() {
                    _attach_money = value;
                  });
                }),
            _ItemCheck(
                value: _trending_up,
                icon: Icons.trending_up,
                description: 'Accelerate design flow',
                onChanged: (value) {
                  setState(() {
                    _trending_up = value;
                  });
                }),
            Divider(),
            _checkTypeBody(),
            SizedBox(
              height: 16,
            ),
            _checkPoint(),
            SizedBox(
              height: 50,
            ),
            _checkSizeBody(),
            _pointSizeBody(),
            _borderBody()
          ],
        ),
      ),
    );
  }

  _Title({String title, double size = 12}) {
    return Text(
      title,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
    );
  }

  _ItemCheck(
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

  _customCheck({bool value, ValueChanged<bool> onChanged}) {
    // return CustomCheck(
    //   value: value,
    //   activeColor: Colors.green,
    //   type: CheckType.circle,
    //   size: 24,
    //   builder: (ctx, size) {
    //     return Icon(
    //       Icons.star,
    //       color: Colors.white,
    //       size: size,
    //     );
    //   },
    //   onChanged: (value) {
    //
    //   },
    // );

   return CustomCheck(
     value: value,
     activeColor: _green,
     type: type,
     size: _sizeCheck,
     borderRadius: _border,
     sizePoint: _sizePoint,
     onChanged: onChanged,
     builder: (_point != null)
         ? (ctx, size) {
             return Icon(
               _point,
               color: Colors.white,
               size: size,
             );
           }
         : null,
   );
  }

  _checkTypeBody() {
    return ListTile(
      title: _Title(title: 'CHECK TYPE'),
      trailing: DropdownButton(
          items: _dropTypes,
          value: _typeString,
          onChanged: (value) {
            if (value == 'custom') {
              setState(() {
                type = CheckType.custom;
              });
            } else {
              setState(() {
                type = CheckType.circle;
              });
            }
          }),
    );
  }

  _borderBody() {
    if (type == CheckType.circle) return empty;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.0),
          child: _Title(title: 'BORDER'),
        ),
        Slider(
          value: _border,
          divisions: 4,
          onChanged: (value) {
            setState(() {
              _border = value;
            });
          },
          activeColor: _green,
          inactiveColor: _green50,
          max: 8,
          min: 0,
        )
      ],
    );
  }

  _pointSizeBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.0),
          child: _Title(title: 'POINT SIZE'),
        ),
        Slider(
          value: _sizePoint,
          divisions: 4,
          activeColor: _green,
          inactiveColor: _green50,
          onChanged: (value) {
            setState(() {
              _sizePoint = value;
            });
          },
          max: 24,
          min: 18,
        )
      ],
    );
  }

  _checkSizeBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.0),
          child: _Title(title: 'CHECK SIZE'),
        ),
        Slider(
          value: _sizeCheck,
          divisions: 5,
          onChanged: (value) {
            setState(() {
              _sizeCheck = value;
            });
          },
          activeColor: _green,
          inactiveColor: _green50,
          max: 50,
          min: 24,
        )
      ],
    );
  }

  _checkPoint() {
    return ListTile(
      title: _Title(title: 'POINTS'),
      trailing: DropdownButton(
          items: _points,
          value: _pointString,
          onChanged: (value) {
            _pointString = value;
            if (value == 'default') {
              setState(() {
                _point = null;
              });
            } else if (value == 'star') {
              setState(() {
                _point = Icons.star;
              });
            } else {
              setState(() {
                _point = Icons.thumb_up;
              });
            }
          }),
    );
  }

  String get _typeString => '${type.toString().replaceAll('CheckType.', '')}';
}
