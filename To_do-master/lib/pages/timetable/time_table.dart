import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/constants/app_color.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime now = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  CalendarFormat _format = CalendarFormat.week;
  Map<DateTime, List<EventCalendar>> _selectedEvents = {};
  List<EventCalendar> getEventsFromDay(DateTime date) {
    return _selectedEvents[date] ?? [];
  }

  @override
  void initState() {
    // TODO: implement initState
    // selectedEvents = {};
    setData();
    setState(() {
      selectedDay = DateTime.utc(now.year, now.month, now.day);
      focusedDay = DateTime.utc(now.year, now.month, now.day);
    });

    super.initState();
  }

  setData() async {
    _selectedEvents[DateTime.utc(now.year, now.month, now.day)] ??= [];
    _selectedEvents[DateTime.utc(now.year, now.month, now.day)]!.add(
      EventCalendar(
        title: "Meeting with client",
        subTitle:
            "To discuss about the upcoming project & organization of figma files.",
        from: "8:30 AM",
        to: "9:30 AM",
        date: DateTime.now(),
      ),
    );
    _selectedEvents[DateTime.utc(now.year, now.month, now.day)]!.add(
      EventCalendar(
        title: "Lunch break",
        subTitle: "To discuss about the upcoming meeting.",
        from: "9:30 AM",
        to: "10:30 AM",
        date: DateTime.now(),
      ),
    );
    _selectedEvents[DateTime.utc(now.year, now.month, now.day)]!.add(
      EventCalendar(
        title: "Daily Stand-Up",
        subTitle:
            "A stand-up meeting is a meeting in which attendees typically participate while standing. The discomfort..",
        from: "10:30 AM",
        to: "11:30 AM",
        date: DateTime.now(),
      ),
    );
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 72,
          automaticallyImplyLeading: false,
          title: ListTile(
            minVerticalPadding: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMMM').format(selectedDay),
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 25,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(2022),
              lastDay: DateTime(2050),

              availableGestures: AvailableGestures.horizontalSwipe,
              calendarFormat: _format,
              formatAnimationCurve: Curves.bounceInOut,
              onFormatChanged: (CalendarFormat? format) {
                setState(() {
                  _format = format!;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: getEventsFromDay,

              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                titleTextStyle:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Tasks of ${DateFormat('dd MMMM').format(selectedDay)}",
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111322)),
            ),
            const SizedBox(
              height: 15,
            ),
            ...getEventsFromDay(DateTime.utc(now.year, now.month, now.day))
                .map((EventCalendar event) => Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text(
                                event.from ?? '',
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF111322)),
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: event.from == "8:30 AM"
                                        ? Colors.purple.withOpacity(0.2)
                                        : event.from == "9:30 AM"
                                            ? Colors.orange.withOpacity(0.2)
                                            : Colors.green.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event.title ?? "",
                                        style: GoogleFonts.inter(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF111322)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          event.subTitle ?? "",
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF4A5578)),
                                        ),
                                      ),
                                      Text(
                                        "${event.from} - ${event.to}",
                                        style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF111322)),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )),
          ],
        ));
  }
}

class EventCalendar {
  String? title;
  String? subTitle;
  DateTime? date;
  String? from;
  String? to;

  EventCalendar({this.title, this.subTitle, this.date, this.from, this.to});
}
