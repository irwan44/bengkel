import 'package:customer_bengkelly/app/componen/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTimePickerPage extends StatefulWidget {
  @override
  _CalendarTimePickerPageState createState() => _CalendarTimePickerPageState();
}

class _CalendarTimePickerPageState extends State<CalendarTimePickerPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay? _selectedTime;
  bool _isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_isDateSelected) ...[
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
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
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedDay != null) {
                  setState(() {
                    _isDateSelected = true;
                  });
                }
              },
              child: Text('Pilih Jadwal'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: MyColors.appPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ] else ...[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              DateFormat('dd/MM/yyyy').format(_selectedDay!),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 200,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              onTimerDurationChanged: (Duration duration) {
                setState(() {
                  _selectedTime = TimeOfDay(
                    hour: duration.inHours,
                    minute: duration.inMinutes % 60,
                  );
                });
              },
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedDay != null && _selectedTime != null) {
                  final selectedDateTime = DateTime(
                    _selectedDay!.year,
                    _selectedDay!.month,
                    _selectedDay!.day,
                    _selectedTime!.hour,
                    _selectedTime!.minute,
                  );
                  Navigator.pop(context, selectedDateTime);
                }
              },
              child: Text('Pilih Jam'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: MyColors.appPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
