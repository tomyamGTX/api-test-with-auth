import 'dart:convert';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/azan.model.dart';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() => _GetAPIState();
}

class _GetAPIState extends State<GetApi> {
  String? fajr;

  String? imsak;

  String? sunrise;

  String? dhuhr;

  String? asr;

  String? susnset;

  String? maghrib;

  String? isha;

  String? midnight;

  @override
  void initState() {
    // TODO: implement initState
    getResponse(
        DateTime.now().day - 1, DateTime.now().month, DateTime.now().year);
    super.initState();
  }

  String? status;
  int? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          DatePicker(
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {});
              getResponse(date.day - 1, date.month, date.year);
            },
          ),
          Card(
              child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Fajar'),
            subtitle: Text('$fajr'),
          )),
          Card(
              child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Imsak'),
            subtitle: Text('$imsak'),
          )),
          Card(
              child: ListTile(
            leading: const Icon(Icons.sunny_snowing),
            title: const Text('Sunrise'),
            subtitle: Text('$sunrise'),
          )),
          Card(
              child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Zohor'),
            subtitle: Text('$dhuhr'),
          )),
          Card(
              child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Asar'),
            subtitle: Text('$asr'),
          )),
          Card(
              child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Maghrib'),
            subtitle: Text('$maghrib'),
          )), Card(
              child: ListTile(
                leading: const Icon(Icons.sunny),
                title: const Text('Sunset'),
                subtitle: Text('$susnset'),
              )),
          Card(
              child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Isya'),
            subtitle: Text('$isha'),
          )),
          Card(
              child: ListTile(
            leading: const Icon(Icons.nightlight_round),
            title: const Text('Midnight'),
            subtitle: Text('$midnight'),
          )),
        ],
      ),
    ));
  }

  Future<void> getResponse(int day, int month, int year) async {
    var url = Uri.parse(
        'https://api.aladhan.com/v1/calendarByCity?city=Kuala%20Lumpur&country=Malaysia&method=2&month=$month&year=$year');
    var response = await http.get(url);
    var data = Azan.fromJson(json.decode(response.body));
    setState(() {});
    status = data.status;
    code = data.code;
    fajr = data.data![day].timings!.fajr;
    imsak = data.data![day].timings!.imsak;
    sunrise = data.data![day].timings!.sunrise;
    dhuhr = data.data![day].timings!.dhuhr;
    asr = data.data![day].timings!.asr;
    susnset = data.data![day].timings!.sunset;
    maghrib = data.data![day].timings!.maghrib;
    isha = data.data![day].timings!.isha;
    midnight = data.data![day].timings!.midnight;
  }
}
