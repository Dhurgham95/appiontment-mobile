import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../models/add_appiontment_response.dart';
import '../services/appiontment/make_appiontment.dart';
import '../services/auth/auth_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String SelectedDate = '';
  String SelectedTime = '';
  late Future<bool> isDone;
  late Future<AddAppiontmentResponseModel> addAppt;
  final AuthService authService = AuthService();
  String token = '';
  void mapUserLoggedInData() async {
    await authService.getUserDataFromToken();
    var utoken =
        await authService.getUserRealData().then((value) => value.token!);
    if (utoken == null || utoken.isEmpty) {
      setState(() {
        token = "";
      });
    } else {
      setState(() {
        token = utoken;
      });
    }
  }

  // DateFormat timeFormat = DateFormat();
  String chnageTime(String time) {
    var chartochkk = time.substring(time.length - 2);
    if (chartochkk.startsWith("A")) {
      return time.substring(0, 6) + "ص";
    }
    return time.substring(0, 6) + "م";
  }

  void showBar(BuildContext context) {
    showTopSnackBar(
      context,
      const CustomSnackBar.success(
        backgroundColor: Color(0xffE3E7F1),
        message: "تمت اضافة طلب حجز موعد بنجاح",
        textStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    token = "";
    Future.delayed(const Duration(microseconds: 50));
    mapUserLoggedInData();
    Future.delayed(const Duration(microseconds: 50));
    debugPrint("Token Check => $token");
    SelectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    SelectedTime = DateFormat("hh:mm a").format(DateTime.now());
    SelectedTime = chnageTime(SelectedTime);

    //  initializeDateFormatting();
    //var dateFormat = new DateFormat.yMMMMd('cs');
    // timeFormat = DateFormat.Hms('ar-SA');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xffBDC6D9),
                        ),
                        // color: Color(0xffBDC6D9),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                child: Text(
                                  "موعد الحجز",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 75.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xff7391C8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        SelectedDate,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 80.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xffE3E7F1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.watch_later_outlined,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        SelectedTime,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              // IconButton(
                              //   onPressed: () {},
                              //   icon: Icon(
                              //     Icons.edit_calendar,
                              //     color: Colors.blue.shade900,
                              //   ),
                              //   highlightColor: Colors.transparent,
                              //   hoverColor: Colors.transparent,
                              //   splashColor: Colors.blue.shade200,
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  DatePicker.showTime12hPicker(context,
                                      showTitleActions: true,
                                      locale: LocaleType.ar,
                                      //     onChanged: (date) {
                                      //   print('change $date in time zone ' +
                                      //       date.timeZoneOffset.inHours.toString());
                                      // },
                                      onConfirm: (date) {
                                    setState(() {
                                      SelectedTime = chnageTime(
                                          DateFormat("hh:mm a").format(date));
                                    });
                                    debugPrint(SelectedTime);
                                  }, currentTime: DateTime.now());
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          side: const BorderSide(
                                              color: Colors.white))),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff7391C8)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "تحديد الوقت",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            TextButton(
                                onPressed: () {
                                  DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: DateTime.now(),
                                    maxTime: DateTime.now()
                                        .add(const Duration(days: 60)),
                                    // theme: DatePickerTheme(
                                    //     headerColor: Colors.orange,
                                    //     backgroundColor: Colors.blue,
                                    //     itemStyle: TextStyle(
                                    //         color: Colors.white,
                                    //         fontWeight: FontWeight.bold,
                                    //         fontSize: 18),
                                    //     doneStyle:
                                    //         TextStyle(color: Colors.white, fontSize: 16)),
                                    onChanged: (date) {
                                      // debugPrint("$SelectedDate ddddd");
                                      // debugPrint('change $date in time zone ' +
                                      //     date.timeZoneOffset.inHours
                                      //         .toString());
                                    },

                                    onConfirm: (date) {
                                      // print('confirm $date');
                                      setState(() {
                                        SelectedDate = DateFormat("yyyy-MM-dd")
                                            .format(date);
                                      });
                                    },
                                    onCancel: () {
                                      setState(() {
                                        SelectedDate = DateFormat("yyyy-MM-dd")
                                            .format(DateTime.now());
                                      });
                                    },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.ar,
                                  );
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          side: const BorderSide(
                                              color: Colors.white))),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff7391C8)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "تحديد التاريخ",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.date_range_rounded,
                                        size: 30,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 25.0, top: 20.0),
                        child: Center(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                addAppt = MakeAppiontment(
                                    SelectedTime, SelectedDate, 5);
                              });
                              isDone =
                                  addAppt.then((value) => value.isSucceed!);
                              showBar(context);
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(const BorderSide(
                                  color: Color(0xff7391C8),
                                  width: 2.0,
                                  style: BorderStyle.solid)),
                              //side: BorderSide(width: 5, color: const Color(0xff7391C8)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "حجز",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Icon(
                                    Icons.bookmark_added_rounded,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
