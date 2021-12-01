import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_student/generated/l10n.dart';

import 'colors.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          BMIApp.delegate
        ],
        supportedLocales: BMIApp.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: mainColor),
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
  final FocusNode _kgFocus = FocusNode();

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
      resizeToAvoidBottomInset:false ,
      appBar: AppBar(title: Text(BMIApp.of(context).bmiComputer)),
      body: Center(
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset('images/bmi_form.png')),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 30, 50, 0),
            child: TextField(
              controller: _kgController,
              focusNode: _kgFocus,
              decoration: InputDecoration(
                hintText: BMIApp.of(context).pleaseEnterKilograms,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
              onSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(_peopleFocus),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 30, 50, 0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: BMIApp.of(context).pleaseEnterHeight),
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
            margin: const EdgeInsets.only(top: 30),
            width: 200,
            child: ElevatedButton(
                child: Text(BMIApp.of(context).count),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => buttonColor)),
                onPressed: () {
                  _getBMI();
                }),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 250,
            child: Text('${BMIApp.of(context).bmiResults} = $sum'),
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
    final m = cm / 100;
    final bmi = kg / (m * m);
    if (_kgController.text.isEmpty || _peopleController.text.isEmpty) {
      sum = '';
    } else {
      sum = bmi.round().toString();
    }
    setState(() {});
  }
}
