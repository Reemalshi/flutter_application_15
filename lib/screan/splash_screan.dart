import 'dart:html';

import 'package:dark_light_button/dark_light_button.dart';
import 'package:date_picker_timetable/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ThemeMode _themeMode = ThemeMode.light;
  DateTime _selectedValue = DateTime.now();
   DateTime? _selectedDay;
  DateTime? _focusedDay;
  // List<Event> events = [
  // Event(name:'Event 1', DateTime.now()),
  // Event(name: 'Event 2', DateTime.now().add(Duration(days: 1))),
  // Add more events as needed
// ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.list,
          color: Colors.black, ),
          // backgroundColor: Colors.white,
          title: Text(
            "My Event",
            style: TextStyle(color: Colors.black), 
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black, 
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _themeMode =
                      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                });
              },
              icon: DarlightButton(
                type: Darlights.DarlightOne,
                onChange: (ThemeMode theme) {
                  setState(() {
                    _themeMode = theme;
                  });
                },
                options: DarlightOneOption(),
              ),
            ),
          ],
        ),
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                 Text("Date",   style: TextStyle(color: Colors.black, fontSize: 22)),
                Text("Today",   style: TextStyle(color: Colors.black, fontSize: 22)),
                
              ],
            ),
           DatePicker(
               DateTime.now(),
                     initialSelectedDate: DateTime.now(),
                     selectionColor: Colors.orange,
                     selectedTextColor: Colors.black,
                      onDateChange: (date) {

                        setState(() {
                          _selectedValue = date;
      
                 });
               },
            ),
 
        ],
         ),
        ),
      );
  }
}


//  SizedBox(height: 20),
    // Expanded(
    //   child: ListView.builder(
    //     itemCount: events.length,
    //     itemBuilder: (context, index) {
    //       if (events[index].date.isAtSameMomentAs(_selectedValue)) {
    //         return ListTile(
    //           title: Text(events[index].name),
    //           trailing: PopupMenuButton<String>(
    //             itemBuilder: (BuildContext context) {
    //               return ['Delete', 'Rewrite'].map((String choice) {
    //                 return PopupMenuItem<String>(
    //                   value: choice,
    //                   child: Text(choice),
    //                 );
    //               }).toList();
    //             },
    //             onSelected: (String choice) {
                  
    //             },
    //           ),
    //         );
    //       }
    //       return Container(); // Return an empty container if no events for the selected date
    //     },
    //   ),
    // ),