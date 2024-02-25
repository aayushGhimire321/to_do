import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/app_image.dart';
import 'package:todo_app/widgets/styled_switch.dart';

class CalendarWidget extends StatefulWidget {
  Function(String? startDate) startDate;
  Function(String? endDate) endDate;
  CalendarWidget({super.key, required this.endDate,required  this.startDate});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late String _startDate, _endDate;
  String? _startTime, _endTime;
  final DateRangePickerController _controller = DateRangePickerController();
  TextStyle style = GoogleFonts.inter(
      color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700);
  TextStyle style2 = GoogleFonts.inter(
      color: primary, fontSize: 17, fontWeight: FontWeight.w700);
  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('MMM dd yyyy').format(today).toString();
    _endDate = DateFormat('MMM dd yyyy')
        .format(today.add(const Duration(days: 3)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(const Duration(days: 3)));
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('MMM dd yyyy').format(args.value.startDate).toString();
      _endDate = DateFormat('MMM dd yyyy')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
    widget.startDate(_startDate);
    widget.endDate(_endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primary,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Calendar",
          style: TextStyle(
              color: primary, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Card(
            elevation: 1,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SfDateRangePickerTheme(
              data: SfDateRangePickerThemeData(
                  weekNumberTextStyle: const TextStyle(color: primary),
                  viewHeaderTextStyle: const TextStyle(
                      fontWeight: FontWeight.w600, color: primary)),
              child: SfDateRangePicker(
                showNavigationArrow: true,
                controller: _controller,
                headerHeight: 70,
                onSelectionChanged: selectionChanged,
                todayHighlightColor: primary,
                headerStyle: const DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: primary)),
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedDate: DateTime.now(),
                selectionTextStyle: const TextStyle(color: Colors.white),
                startRangeSelectionColor: primary,
                endRangeSelectionColor: primary,
                rangeSelectionColor: Colors.grey.shade200,
                monthViewSettings:
                    const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                rangeTextStyle: const TextStyle(color: primary, fontSize: 17),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayTextStyle: const TextStyle(color: Colors.white),
                  todayCellDecoration: BoxDecoration(
                      color: Colors.grey.shade500, shape: BoxShape.circle),
                  textStyle: const TextStyle(
                      color: primary, fontSize: 17, fontWeight: FontWeight.w500
                      // Change the color of weekdays here
                      ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _startTime = picked.format(context);
                    });

                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      start,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _startDate,
                          style: style,
                        ),
                        Text(
                          _startTime ?? "select time",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFA29EB6),
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: InkWell(
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      _endTime = picked.format(context);
                      // _endTime =
                      //     "${picked.hour.toString()} : ${picked.minute.toString()};
                    });
                    print({
                      picked.hour.toString() + ':' + picked.minute.toString()
                    });
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      end,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _endDate,
                          style: style,
                        ),
                        Text(
                          _endTime ?? "select time",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFA29EB6),
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
              "End date",
              style: style2,
            ),
            trailing: StyledSwitch(onToggled: (value) {}, toogle: true),
          ),
          ListTile(
            title: Text("Include time", style: style2),
            trailing: StyledSwitch(onToggled: (value) {}, toogle: true),
          ),
        ],
      ),
    );
  }
}
