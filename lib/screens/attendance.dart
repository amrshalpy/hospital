import 'package:flutter/material.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2022, 1, 1): ['New Year\'s Day'],
  DateTime(2022, 1, 6): ['Epiphany'],
  DateTime(2022, 2, 14): ['Valentine\'s Day'],
  DateTime(2022, 4, 21): ['Easter Sunday'],
  DateTime(2022, 4, 22): ['Easter Monday'],
};

class attendance extends StatefulWidget {
  attendance({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _attendanceState createState() => _attendanceState();
}

class _attendanceState extends State<attendance> with TickerProviderStateMixin {
  late Map<DateTime, List> _events;
  late List _selectedEvents;
  late AnimationController _animationController;
  late CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'محمود علي ١٢.٠٠',
        'محمود علي ١٢.٠٠',
        'محمود علي ١٢.٠٠',
      ],
      _selectedDay.subtract(Duration(days: 27)): ['محمود علي ١٢.٠٠',],
      _selectedDay.subtract(Duration(days: 20)): [
        'محمود علي ١٢.٠٠',
        'محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',
      ],
      _selectedDay.subtract(Duration(days: 16)): ['محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',],
      _selectedDay.subtract(Duration(days: 10)): [
        'محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',
      ],
      _selectedDay.subtract(Duration(days: 2)): ['محمود علي ١٢.٠٠'],
      _selectedDay: ['محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠'],
      _selectedDay.add(Duration(days: 1)): [
        'محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',]).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'محمود علي ١٢.٠٠',
      ],
      _selectedDay.add(Duration(days: 11)): ['محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',],
      _selectedDay.add(Duration(days: 17)): [
        'محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',
      ],
      _selectedDay.add(Duration(days: 22)): ['محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',],
      _selectedDay.add(Duration(days: 26)): [
        'محمود علي ١٢.٠٠','محمود علي ١٢.٠٠','محمود علي ١٢.٠٠',
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: kMainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: Backgroundbottom(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Switch out 2 lines below to play with TableCalendar's settings
            //-----------------------
            _buildTableCalendar(),
            // _buildTableCalendarWithBuilders(),
            const SizedBox(height: 8.0),
            _buildButtons(),
            const SizedBox(height: 8.0),
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.green[400],
        todayColor: kMainColor,
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pl_PL',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildButtons() {
    final dateTime = DateTime.now();

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.month);
                });
              },
              child: Text('شهر'),
              style: ElevatedButton.styleFrom(
                primary: kMainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            ElevatedButton(
              child: Text('اسبوعين'),
              onPressed: () {
                setState(() {
                  _calendarController
                      .setCalendarFormat(CalendarFormat.twoWeeks);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: kMainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            ElevatedButton(
              child: Text('اسبوع'),
              onPressed: () {
                setState(() {
                  _calendarController.setCalendarFormat(CalendarFormat.week);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: kMainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
            child: Text(
                ' اليوم  ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
            onPressed: () {
              _calendarController.setSelectedDay(
                DateTime(dateTime.year, dateTime.month, dateTime.day),
                runCallback: true,
              );
              style:
              ElevatedButton.styleFrom(
                  primary: kMainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)));
            }),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Center(child: Text(event.toString())),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
