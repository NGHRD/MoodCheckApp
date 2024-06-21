import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../services/auth_service.dart';
import '../../services/utilities.dart';

class HomeSubDiaryPage extends StatefulWidget {
  @override
  State<HomeSubDiaryPage> createState() => _HomeSubDiaryPage();
}

class _HomeSubDiaryPage extends State<HomeSubDiaryPage> {
  final _auth = AuthService();
  late final ValueNotifier<List<Note>> _selectedNotes;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  final List<Feature> features = [
    Feature(
      title: "Dagelijkse score",
      color: const Color(0XFFFFB99C),
      data: [0.0, 0.0, 0.0, 0.0, 0.0],
    )
  ];

  void initState() {
    super.initState();
    _loadData(); // Call a separate function to fetch data

    _selectedDay = _focusedDay;
    _selectedNotes = ValueNotifier(_getNotesForDay(_selectedDay!));
  }

  void _loadData() async {
    final dayScores = await _auth.getDayScores();
    setState(() {
      features[0].data = dayScores;
    });
  }

  @override
  void dispose() {
    _selectedNotes.dispose();
    super.dispose();
  }

  List<Note> _getNotesForDay(DateTime day) {
    return kNotes[day] ?? [];
  }

  List<Note> _getNotesForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getNotesForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedNotes.value = _getNotesForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedNotes.value = _getNotesForRange(start, end);
    } else if (start != null) {
      _selectedNotes.value = _getNotesForDay(start);
    } else if (end != null) {
      _selectedNotes.value = _getNotesForDay(end);
    }
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
        child: Column(
          children: [
            const SizedBox(height: 20),
            LineGraph(
              features: features,
              size: Size(380, 280),
              labelX: ['-4 dagen', '-3 dagen', '-2 dagen', 'Gister', 'Vandaag'],
              labelY: ['2', '4', '6', '8', '10'],
              showDescription: true,
              descriptionHeight: 50,
            ),
            TableCalendar<Note>(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: CalendarFormat.twoWeeks,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: _getNotesForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
              ),
              onDaySelected: _onDaySelected,
              onRangeSelected: _onRangeSelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Note>>(
                valueListenable: _selectedNotes,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () => print('${value[index]}'),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}