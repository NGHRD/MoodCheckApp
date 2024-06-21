import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get_storage/get_storage.dart';
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

final box = GetStorage();


class _HomeSubDiagnosePageState extends State<HomeSubTodayPage> {
  final _utilities = Utilities();
  final _auth = AuthService();
  final TextEditingController _notesController = TextEditingController();
  final String username = box.read('username');
  String _emotion = "happy";
  double _dayScore = 7;

  Map<String, dynamic> _experience = {
    'sleepProblems': false,
    'tiredness': false,
    'concentrationProblems': false,
    'dizziness': false,
    'decreasedAppetite': false,
    'stressed': false
  };

  void save () {
    box.write('emotion', _emotion);
    box.write('experience', jsonEncode(_experience));
    box.write('dayScore', _dayScore);
    box.write('notes', _notesController.text);
    _auth.saveDayData(
        DateTime.now().toString(),
        _emotion.toString(),
        _experience,
        _dayScore,
        _notesController.text
    );
  }

  @override
  void initState() {
    if(box.read('emotion') != null) {
      _emotion =  box.read('emotion');
    }
    if(box.read('experience') != null) {
      _experience =  jsonDecode(box.read('experience'));
    }
    if(box.read('dayScore') != null) {
      _dayScore =  box.read('dayScore');
    }
    if(box.read('notes') != null) {
      _notesController.text =  box.read('notes');
    }
    super.initState();
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
                    'Hé ${username}, hoe ging het vandaag?',
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
                            value: "happy",
                            groupValue: _emotion,
                            onChanged: (value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Boos",
                            value: "angry",
                            groupValue: _emotion,
                            onChanged: (value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Verdrietig",
                            value: "sad",
                            groupValue: _emotion,
                            onChanged: (value) {
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
                            value: "anxious",
                            groupValue: _emotion,
                            onChanged: (value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Afschuw",
                            value: "disgust",
                            groupValue: _emotion,
                            onChanged: (value) {
                              setState(() {
                                _emotion = value;
                              });
                            },
                          ),
                          MyRadioListTile(
                            text: "Verbaasd",
                            value: "amazed",
                            groupValue: _emotion,
                            onChanged: (value) {
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
                        controller: _notesController,
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
