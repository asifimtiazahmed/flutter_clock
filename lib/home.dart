import 'dart:async';
import 'widgets/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'shapes_painter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _timeString;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    _timeString = _formatDateTime(DateTime.now());
//Callback
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          //backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).accentColor,
              indicatorWeight: 4.0,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.access_time),
                  text: 'Clock',
                ),
                Tab(
                  icon: Icon(Icons.alarm),
                  text: 'Alarm',
                ),
                Tab(
                  icon: Icon(Icons.hourglass_empty),
                  text: 'Timer',
                ),
                Tab(
                  icon: Icon(Icons.timer),
                  text: 'Stopwatch',
                ),
              ]),
        ),
        body: Container(
          child: TabBarView(
            controller:
                _tabController, //As the controller has been defined to have 4 tabs we must return 4 children
            children: [
              //CLOCK
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomPaint(
                        painter: ShapesPainter(),
                        child: Container(height: 500.0),
                      ),
                    ),
                    Text(
                      _timeString.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //ALARM
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 500,
                        child: ListView(
                          children: [
                            alarmItem(_timeString, true),
                            alarmItem(_timeString, true),
                            alarmItem(_timeString, true),
                            alarmItem(_timeString, true),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //TIMER
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('hi!'),
                    ),
                  ],
                ),
              ),
              //STOPWATCH
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('hi!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: _bottomButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _bottomButtons() {
    return _tabController.index == 1
        ? FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/add-alarm'),
            backgroundColor: Color(0xFF65D1BA),
            child: Icon(
              Icons.add,
              size: 20.0,
            ),
          )
        : null;
  }
}
