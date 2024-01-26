import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants/colors.dart';
import 'package:intl/intl.dart';

class TableCalendarWidget extends StatelessWidget{
  final DateTime focusedDay;
  final DateTime kFirstDay;
  final DateTime kLastDay;
  final Function(DateTime,DateTime) onDaySelected;
  final Function(DateTime) onPageChanged;
  final bool Function(DateTime) selectedDayPredicate;

  const TableCalendarWidget({
    super.key,
    required this.onDaySelected,
    required this.selectedDayPredicate,
    required this.onPageChanged,
    required this.focusedDay,
    required this.kFirstDay,
    required this.kLastDay
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      child: TableCalendar(
        onPageChanged: onPageChanged,
        focusedDay: focusedDay,
        firstDay: kFirstDay,
        lastDay: kLastDay,
        startingDayOfWeek: StartingDayOfWeek.monday,
        onDaySelected: onDaySelected,
        selectedDayPredicate: selectedDayPredicate,
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date)[0],
          weekdayStyle: const TextStyle(
              color: black25,
              fontWeight: FontWeight.w600
          ),
          weekendStyle: const TextStyle(
              color: black25,
              fontWeight: FontWeight.w600
          ),
        ),
        calendarStyle: const CalendarStyle(
          outsideTextStyle: TextStyle(
            color: secondary,
          ),
          weekendTextStyle:  TextStyle(
            color: black25,
          ),
          defaultTextStyle: TextStyle(
            color: black25,
          ),
          todayTextStyle: TextStyle(
            color: black25,
          ),
          todayDecoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle
          ),
          selectedDecoration: BoxDecoration(
              color: primary,
              shape: BoxShape.circle
          ),
        ),

        headerStyle: const HeaderStyle(
          titleCentered: true,
          rightChevronIcon: Icon(Icons.chevron_right,color: primary),
          leftChevronIcon: Icon(Icons.chevron_left,color: primary),
          formatButtonVisible: false,
          rightChevronMargin: EdgeInsets.symmetric(horizontal: 0),
          leftChevronMargin: EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
    );
  }
}