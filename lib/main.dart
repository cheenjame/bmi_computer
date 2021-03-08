import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(FirstAPP());
}

class FirstAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: BMIPage());
  }
}

class BMIPage extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMIPage> {
  /// 公斤輸入控制器
  final _kgController = TextEditingController();

  /// 公斤輸入焦點
  final _kgFocus = FocusNode();

  /// 身高輸入控制器
  final _peopleController = TextEditingController();

  /// 身高輸入焦點
  final _peopleFocus = FocusNode();
  String sum = '';
  @override
  void dispose() {
    super.dispose();
    _kgController.dispose();
    _kgFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI計算機')),
      body: Center(
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset('images/bmi_form.png')),
          Container(
            margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
            child: TextField(
              controller: _kgController,
              focusNode: _kgFocus,
              decoration: InputDecoration(
                hintText: '請輸入公斤',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
              onSubmitted: (value) {
                FocusScope.of(context).requestFocus(_peopleFocus);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 250,
            child: TextField(
              decoration: InputDecoration(labelText: '請輸入身高'),
              controller: _peopleController,
              focusNode: _peopleFocus,
              onSubmitted: (value) => Focus.of(context).dispose(),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 200,
            child: ElevatedButton(
                child: Text('計算'),
                onPressed: () {
                  _getBMI();
                }),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 250,
            child: Text('BMI結果 = $sum'),
          )
        ]),
      ),
    );
  }

  void _getBMI() {
    int kg = 0;
    try {
      kg = int.parse(_kgController.text);
    } on Exception {
      kg = 0;
    }

    int cm = 0;
    try {
      cm = int.parse(_peopleController.text);
    } on Exception {
      cm = 0;
    }
    double m = cm / 100;
    var bmi = kg / (m * m);
    print('SSs  = ${_kgController.text}');
    if (_kgController.text.isEmpty || _peopleController.text.isEmpty) {
      sum = '';
    } else {
      sum = bmi.round().toString();
    }
    setState(() {});
  }
}
