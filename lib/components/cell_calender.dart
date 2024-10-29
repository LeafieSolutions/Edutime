import 'package:edutime/color/app_text_colors.dart';
import 'package:edutime/components/event_tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import '../color/app_component_colors.dart';

class CustomGoogleCalendar extends StatefulWidget {
  const CustomGoogleCalendar({super.key});

  @override
  State<CustomGoogleCalendar> createState() => _CustomGoogleCalendarState();
}

class _CustomGoogleCalendarState extends State<CustomGoogleCalendar> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _showDraggableSheet = false;

  // Text Controllers for input fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // List of buildings and rooms
  final Map<String, List<String>> _buildingsWithRooms = {
    'Complex A': ['Room 101', 'Room 102', 'Room 103'],
    'Complex B': ['Room 201', 'Room 202', 'Room 203'],
    'Complex C': ['Room 301', 'Room 302', 'Room 303'],
  };

  // Selected building and room
  String? _selectedBuilding;
  String? _selectedRoom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfCalendar(
          backgroundColor:Theme.of(context).brightness == Brightness.light
            ? AppTextColors.pureWhite
            : AppTextColors.pureBlack,

          view: CalendarView.workWeek,
          allowedViews: const [
            CalendarView.schedule,
            CalendarView.workWeek,
            CalendarView.week,
            CalendarView.month,
          ],
          onTap: (CalendarTapDetails details) {
            if (details.targetElement == CalendarElement.calendarCell) {
              setState(() {
                _selectedDate = details.date!;
                _selectedTime = TimeOfDay.fromDateTime(details.date!);
                _showDraggableSheet = true;
              });
            }
          },
          timeSlotViewSettings: TimeSlotViewSettings(
            startHour: 5,
            endHour: 22,
            timeInterval: const Duration(hours: 1)
          ),
        ),
        if (_showDraggableSheet)
          DraggableScrollableSheet(
            initialChildSize: 0.25.h,
            minChildSize: 0.25.h,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(26.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _actionButtonRow(
                        Theme.of(context).brightness == Brightness.light
                            ? AppComponentColors.deepGreyFill
                            : AppComponentColors.darkGreyComponentFill,
                        Theme.of(context).cardColor,
                        Theme.of(context).textTheme.headlineMedium!.color!,
                      ),
                      SizedBox(height: 14.h),
                      _pickTitle(
                        Theme.of(context).brightness == Brightness.light
                            ? AppComponentColors.deepGreyFill
                            : AppComponentColors.darkGreyComponentFill,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 40.h,
                        child: _eventTypeListView(),
                      ),
                      SizedBox(height: 40.h),
                      _pickDateAndTime(
                        Theme.of(context).brightness == Brightness.light
                          ? AppComponentColors.deepGreyFill
                          : AppComponentColors.darkGreyComponentFill,
                      ),
                      _pickDateAndTime2(
                        Theme.of(context).brightness == Brightness.light
                            ? AppComponentColors.deepGreyFill
                            : AppComponentColors.darkGreyComponentFill
                      ),
                      SizedBox(height: 40.h),
                      _repeatEvent(
                        Theme.of(context).brightness == Brightness.light
                          ? AppComponentColors.deepGreyFill
                          : AppComponentColors.darkGreyComponentFill
                      ),
                      SizedBox(height: 35.h),
                      _pickVenue(
                        Theme.of(context).brightness == Brightness.light
                            ? AppComponentColors.deepGreyFill
                            : AppComponentColors.darkGreyComponentFill
                      ),
                      SizedBox(height: 35.h),
                      _virtualVenue(
                        Theme.of(context).brightness == Brightness.light
                            ? AppComponentColors.deepGreyFill
                            : AppComponentColors.darkGreyComponentFill
                      ),
                      SizedBox(height: 40.h),
                      _eventDescription(
                        Theme.of(context).brightness == Brightness.light
                            ? AppComponentColors.deepGreyFill
                            : AppComponentColors.darkGreyComponentFill
                      )
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  Row _actionButtonRow(Color? iconColor, Color buttonBg, Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _showDraggableSheet = false;
            });
          },
          child: SvgPicture.asset(
            'assets/icons/Cross.svg',
            width: 18.w,
            height: 18.w,
            colorFilter: ColorFilter.mode(
              iconColor!,
              BlendMode.srcIn,
            ),
          ),
        ),
        Container(
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            color: buttonBg,
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 14.spMax,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }

  ListView _eventTypeListView() {
    final Map<String, String> eventTabList = {
      'Class': 'assets/icons/Lesson.svg',
      'Exam': 'assets/icons/Exam.svg',
      'Submission': 'assets/icons/Clipboard.svg',
      'Function': 'assets/icons/Calendar.svg',
    };
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: eventTabList.length,
      itemBuilder: (BuildContext context, int index) {
        return EventTabs(
          svgPath: eventTabList.values.elementAt(index),
          text: eventTabList.keys.elementAt(index),
        );
      },
    );
  }

  Row _pickTitle(Color? iconColor) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Cabinet.svg',
          width: 24.w,
          height: 24.w,
          colorFilter: ColorFilter.mode(iconColor!, BlendMode.srcIn),
        ),
        SizedBox(width: 20.w),
        Text(
          'Add title',
          style: TextStyle(
            color: iconColor,
            fontSize: 24.w,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(child: Container()), // Spacer
        SvgPicture.asset(
          'assets/icons/Bin.svg',
          width: 16.w,
          height: 20.w,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        )
      ],
    );
  }

  Row _pickDateAndTime(Color? iconColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/Clock.svg',
          width: 22.w,
          height: 22.w,
          colorFilter: ColorFilter.mode(
            iconColor!,
            BlendMode.srcIn
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          DateFormat('EEE, dd MMM yyyy').format(_selectedDate!),
          style: TextStyle(
            color: iconColor,
            fontSize: 14.w,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(child: Container()),
        Text(
          '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
          style: TextStyle(
            color: iconColor,
            fontSize: 14.w,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Container _pickDateAndTime2(Color? iconColor) {
    return Container(
      margin: EdgeInsets.only(left: 42.w, top: 20.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('EEE, dd MMM yyyy').format(_selectedDate!),
            style: TextStyle(
              color: iconColor,
              fontSize: 14.w,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          Text(
            addTwoHoursAndFormat(_selectedTime!),
            style: TextStyle(
              color: iconColor,
              fontSize: 14.w,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Row _repeatEvent(Color? iconColor) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Cycle.svg',
          width: 24.w,
          height: 24.w,
          colorFilter: ColorFilter.mode(
            iconColor!,
            BlendMode.srcIn
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          'Does not Repeat',
          style: TextStyle(
            color: iconColor,
            fontSize: 14.w,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Row _pickVenue(Color? iconColor) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Pin.svg',
          width: 22.w,
          height: 22.w,
          colorFilter: ColorFilter.mode(
              iconColor!,
              BlendMode.srcIn
          ),
        ),
        SizedBox(width: 20.w),
        // Building Dropdown
        Expanded(
          child: DropdownButton<String>(
            dropdownColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            value: _selectedBuilding,
            hint: Text(
              'Select School',
              style: TextStyle(
                color: iconColor,
                fontSize: 14.w,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            onChanged: (String? newValue) {
              setState(() {
                _selectedBuilding = newValue;
                _selectedRoom = null; // Reset room selection
              });
            },
            items: _buildingsWithRooms.keys.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(width: 20.w),

        // Room Dropdown
        Expanded(
          child: DropdownButton<String>(
            dropdownColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            value: _selectedRoom,
            hint: Text(
              'Select Room',
              style: TextStyle(
                color: iconColor,
                fontSize: 14.w,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            onChanged: _selectedBuilding != null
                ? (String? newValue) {
              setState(() {
                _selectedRoom = newValue;
              });
            }
                : null, // Disable if no building is selected
            items: _selectedBuilding != null
                ? _buildingsWithRooms[_selectedBuilding]!
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()
                : [],
          ),
        ),
      ],
    );
  }

  Row _virtualVenue(Color? iconColor) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Video.svg',
          width: 22.w,
          height: 22.w,
          colorFilter: ColorFilter.mode(
            iconColor!,
            BlendMode.srcIn
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          'Meeting Link',
          style: TextStyle(
            color: iconColor,
            fontSize: 14.w,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Row _eventDescription(Color? iconColor) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Description.svg',
          width: 22.w,
          height: 22.w,
          colorFilter: ColorFilter.mode(
              iconColor!,
              BlendMode.srcIn
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          'Description',
          style: TextStyle(
            color: iconColor,
            fontSize: 14.w,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
  // TextField builder
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  // Submit button
  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: _submitEvent,
        child: const Text('Submit'),
      ),
    );
  }

  // Submit event logic
  void _submitEvent() {
    final String title = _titleController.text;
    final String venue = _venueController.text;
    final String link = _linkController.text;
    final String description = _descriptionController.text;

    if (title.isNotEmpty && venue.isNotEmpty) {
      // Handle the event submission logic here
      if (kDebugMode) {
        print('Event Submitted: $title, $_selectedDate');
      }

      setState(() {
        _showDraggableSheet = false;  // Close the sheet after submission
      });
    }
  }

  String addTwoHoursAndFormat(TimeOfDay selectedTime) {
    // Add two hours and handle overflow if it goes past 24 hours
    TimeOfDay newTime = selectedTime.replacing(
      hour: (selectedTime.hour + 2) % 24,  // Wrap around if over 24 hours
    );

    // Return the formatted string
    return '${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}';
  }
}