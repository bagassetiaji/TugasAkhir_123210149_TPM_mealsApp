import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:projek_akhir/models/time_conversion.dart';

class TimeConverterWidget extends StatefulWidget {
  @override
  _TimeConverterWidgetState createState() => _TimeConverterWidgetState();
}

class _TimeConverterWidgetState extends State<TimeConverterWidget> {
  String _selectedFromTimeZone = 'WIB';
  String _selectedToTimeZone = 'WITA';
  String _convertedTime = '';

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    DateTime now = DateTime.now();
    setState(() {
      _convertedTime = TimeConversion.convertTime(
        now,
        _selectedFromTimeZone,
        _selectedToTimeZone,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Conversion', style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange[600],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Time: $_convertedTime',
              style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_downward_rounded), // Optional icon
                    SizedBox(width: 8),
                    Text(
                      'Convert to ',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: DropdownButton<String>(
                    value: _selectedToTimeZone,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedToTimeZone = newValue!;
                        _updateTime();
                      });
                    },
                    items: <String>['WIB', 'WITA', 'WIT'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: GoogleFonts.poppins()),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}