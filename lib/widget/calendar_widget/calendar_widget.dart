import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kalliyath_villa/Screens/booking_page/bloc/booking_bloc.dart';
import 'package:kalliyath_villa/Screens/booking_page/booking/add_date_person/add_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/widget/calendar_widget/date_widget.dart';
import 'package:table_calendar/table_calendar.dart';

String startingddate = '';
String endingdate = '';
DateTime? selecteddate;

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key, required this.eventsMap});
  final Map<DateTime, List<dynamic>> eventsMap;
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime? focusedday;

  @override
  void initState() {
    super.initState();

    focusedday = DateTime.now().isBefore(DateTime.now())
        ? DateTime.now()
        : DateTime.utc(2024, 3, 14);
    selecteddate = focusedday;
  }

  final calendarbloc = BookingBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      bloc: calendarbloc,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TableCalendar(
            focusedDay: focusedday!,
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2050, 3, 14),
            selectedDayPredicate: (day) => isSameDay(selecteddate, day),
            calendarFormat: CalendarFormat.month,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: AppColors.white),
              weekendStyle: TextStyle(color: AppColors.white),
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: _onDayselected,
            rangeStartDay: startdate,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: AppColors.white),
              titleCentered: true,
              leftChevronIcon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: AppColors.white,
                size: 20,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.white,
                size: 20,
              ),
            ),
            rangeEndDay: enddate,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: false,
              rangeEndDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blue,
              ),
              rangeStartDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blue,
              ),
              defaultTextStyle: TextStyle(color: AppColors.white),
              holidayTextStyle: TextStyle(color: AppColors.white),
              weekendTextStyle: TextStyle(color: AppColors.white),
              rangeHighlightColor: AppColors.white,
              disabledTextStyle:
                  TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
              withinRangeTextStyle: TextStyle(
                color: AppColors.black,
              ),
              outsideDaysVisible: false,
            ),
            onRangeSelected: _onRangeSelected,
            onPageChanged: (focusedDay) {
              focusedday = focusedDay;
              calendarbloc.add(CalenarBuilder());
            },
            eventLoader: (day) {
              if (widget.eventsMap.containsKey(day)) {
                return widget.eventsMap[day]!;
              } else {
                return [];
              }
            },
            calendarBuilders: CalendarBuilders(
              disabledBuilder: (context, date, _) {
                if (!widget.eventsMap.containsKey(date)) {
                  return null;
                } else {
                  return Center(
                      child: Icon(
                    Icons.luggage_rounded,
                    size: 18,
                    color: Color.fromARGB(159, 125, 119, 118),
                  ));
                }
              },
            ),
            enabledDayPredicate: (DateTime day) {
              return isSameDay(day, enddate) ||
                  !widget.eventsMap.containsKey(day);
            },
          ),
        );
      },
    );
  }

  void _onDayselected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(selecteddate, selectedDay)) {
      selecteddate = selectedDay;
      focusedday = focusedDay;
      calendarbloc.add(CalenarBuilder());
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    DateTime startDateBefore = start != null
        ? start.subtract(const Duration(days: 1))
        : DateTime.now();
    DateTime startDateAfter =
        start != null ? start.add(const Duration(days: 1)) : DateTime.now();
    if (widget.eventsMap.containsKey(startDateAfter.toUtc()) &&
        widget.eventsMap.containsKey(startDateBefore.toUtc())) {
      print('success');
      selecteddate = null;
      focusedday = focusedDay;
      startingddate = DateFormat.yMMMd().format(start ?? DateTime.now());
      endingdate = DateFormat.yMMMd().format(startDateAfter);

      startdate = start;
      enddate = startDateAfter;
      datebuildbloc.add(CalenardateBuilder());
      calendarbloc.add(CalenarBuilder());
      print(startdate);
      print(enddate);
    } else {
      if (!_hasEvents(
        start ?? DateTime.now(),
        end ?? DateTime.now(),
      )) {
        selecteddate = null;
        focusedday = focusedDay;
        startingddate = DateFormat.yMMMd().format(start ?? DateTime.now());
        endingdate = DateFormat.yMMMd().format(end ?? DateTime.now());
        startdate = start;
        enddate = end;

        datebuildbloc.add(CalenardateBuilder());
        calendarbloc.add(CalenarBuilder());
      }
    }
  }

  @override
  void dispose() {
    selecteddate = null;
    startingddate = '';
    endingdate = '';
    calendarbloc.close();
    super.dispose();
  }

  bool _hasEvents(DateTime start, DateTime end) {
    for (DateTime date = start;
        date.isBefore(end);
        date = date.add(const Duration(days: 1))) {
      if (widget.eventsMap.containsKey(date)) {
        return true;
      }
    }
    return false;
  }
}
