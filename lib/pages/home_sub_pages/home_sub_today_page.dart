import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_check/components/my_checkbox_tile.dart';
import 'package:mood_check/components/my_radio_list_tile.dart';
import 'package:mood_check/services/utilities.dart';

import '../../components/my_button.dart';
import '../../services/auth_service.dart';

class HomeSubTodayPage extends StatefulWidget {
  const HomeSubTodayPage({super.key});

  @override
  State<HomeSubTodayPage> createState() => _HomeSubDiagnosePageState();
}

enum EmotionsEnum {
  happy,
  angry,
  sad,
  anxious,
  disgust,
  amazed
}

class _HomeSubDiagnosePageState extends State<HomeSubTodayPage> {
  final _utilities = Utilities();
  final _auth = AuthService();
  final TextEditingController _notesController = TextEditingController();
  EmotionsEnum? _emotion = EmotionsEnum.happy;
  double _dayScore = 7;

  final Map<String, bool> _experience = {
    'sleepProblems': false,
    'tiredness': false,
    'concentrationProblems': false,
    'dizziness': false,
    'decreasedAppetite': false,
    'stressed': false
  };

  void save () {
    _auth.saveDayData(
        _emotion.toString(),
        _experience,
        _dayScore,
        _notesController.text
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6CDC8),
        title: Center(
          child: Text(
            "Moodcheck",
            style: GoogleFonts.inika(
              fontSize: 20
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0XFFF5F0ED),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    color: Color(0XFFCFD9F2),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: Text(
                          _utilities.getCurrentDate()
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hé ...., hoe ging het vandaag?',
                    style: GoogleFonts.inika(
                      fontSize: 22
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welke emotie beschijft jou dag?',
                    style: GoogleFonts.inika(
                        fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          MyRadioListTile(
                            text: "Blij",
                            value: EmotionsEnum.happy,
                            groupValue: _emotion,
                            onChanged: (EmotionsEnum? value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Boos",
                            value: EmotionsEnum.angry,
                            groupValue: _emotion,
                            onChanged: (EmotionsEnum? value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Verdrietig",
                            value: EmotionsEnum.sad,
                            groupValue: _emotion,
                            onChanged: (EmotionsEnum? value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          MyRadioListTile(
                            text: "Angstig",
                            value: EmotionsEnum.anxious,
                            groupValue: _emotion,
                            onChanged: (EmotionsEnum? value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Afschuw",
                            value: EmotionsEnum.disgust,
                            groupValue: _emotion,
                            onChanged: (EmotionsEnum? value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Verbaasd",
                            value: EmotionsEnum.amazed,
                            groupValue: _emotion,
                            onChanged: (EmotionsEnum? value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Wat heb je vandaag ervaren?',
                    style: GoogleFonts.inika(
                        fontSize: 18
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          MyCheckboxTile(
                            text: "Slaap problemen",
                            value: _experience["sleepProblems"] as bool,
                            onChanged: (value) {
                              setState(() {
                                _experience["sleepProblems"] = value as bool;
                              });
                            },
                          ),
                          MyCheckboxTile(
                            text: "Vermoeiheid",
                            value: _experience["tiredness"] as bool,
                            onChanged: (value) {
                              setState(() {
                                _experience["tiredness"] = value as bool;
                              });
                            },
                          ),
                          MyCheckboxTile(
                            text: "Problemen concentreren",
                            value: _experience["concentrationProblems"] as bool,
                            onChanged: (value) {
                              setState(() {
                                _experience["concentrationProblems"] = value as bool;
                              });
                            },
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          MyCheckboxTile(
                            text: "Duizeligheid",
                            value: _experience["dizziness"] as bool,
                            onChanged: (value) {
                              setState(() {
                                _experience["dizziness"] = value as bool;
                              });
                            },
                          ),
                          MyCheckboxTile(
                            text: "Slechte eetlust",
                            value: _experience["decreasedAppetite"] as bool,
                            onChanged: (value) {
                              setState(() {
                                _experience["decreasedAppetite"] = value as bool;
                              });
                            },
                          ),
                          MyCheckboxTile(
                            text: "Veel stress",
                            value: _experience["stressed"] as bool,
                            onChanged: (value) {
                              setState(() {
                                _experience["stressed"] = value as bool;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Wat is je cijfer vandaag?',
                    style: GoogleFonts.inika(
                        fontSize: 18
                    ),
                  ),
                  Slider(
                    activeColor:  const Color(0XFFFFB99C),
                    value: _dayScore,
                    max: 10,
                    min: 1,
                    divisions: 9,
                    label: _dayScore.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _dayScore = value;
                      });
                    }
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Notities van vandaag',
                    style: GoogleFonts.inika(
                        fontSize: 18
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      color: Colors.white,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 10,
                        style: GoogleFonts.inika(
                          backgroundColor: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    text: 'Opslaan',
                    onTab: save,
                    color: const Color(0XFFFFB99C),
                  ),
                  const SizedBox(height: 30),
                ],
              )
          ),
        ),
      ),
    );
  }
}
