import 'package:flutter/material.dart';
import 'widgets/circle_dat.dart';

class AddAlarm extends StatefulWidget {
  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {

  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  @override
  void initState(){
    _selectedTime = new TimeOfDay(
      hour: 12,
      minute: 30,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B2C57),
      appBar: AppBar(
          backgroundColor: Color(0xFF1B2C57),
        title: Column(
          children: [
            Icon(Icons.alarm_add, color: Color(0xFF65D1BA)),
            Text('Add Alarm', style: TextStyle(color: Color(0xFF65D1BA), fontSize: 25.0)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 60.0,),
            GestureDetector(
              child: Text(_selectedTime.format(context), style: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
              onTap: (){
                _selectTime(context);
              },
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                circleDay('Mon', context, false),
                circleDay('Tue', context, true),
                circleDay('Wed', context, true),
                circleDay('Thr', context, false),
                circleDay('Fri', context, false),
                circleDay('Sat', context, true),
                circleDay('Sun', context, false),
              ],
            ),
          ],
        ),
      ),
    );

  }
  Future<void> _selectTime(BuildContext context) async{
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime
    );
    setState(() {
      _selectedTime = picked;
    });

  }
}
