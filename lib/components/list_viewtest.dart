import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_appiontment/models/appiontment_list_model.dart';
import 'package:mobile_appiontment/models/edit_appiontment_res.dart';
import 'package:mobile_appiontment/pages/main_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:ui' as ui;
import '../services/appiontment/appiontment_list.dart';
import '../services/appiontment/edit_appiontment_service.dart';
import '../services/auth/auth_service.dart';

class LstView extends StatefulWidget {
  const LstView({Key? key}) : super(key: key);

  @override
  State<LstView> createState() => _LstViewState();
}

class _LstViewState extends State<LstView> {
  late Future<List<AppiontmentListModel>> listofModel;
  String SelectedDate = '';
  String SelectedTime = '';
  int selectedAppId = 0;
  DateTime currentDate = DateTime.now();
  String canceledDate = "";
  // DateTime currenttTime = DateTime.now();
  String canceledTime = "";

  final AuthService authService = AuthService();
  String token = '';
  int userId = 0;
  void mapUserLoggedInData() async {
    await authService.getUserDataFromToken();
    var utoken =
        await authService.getUserRealData().then((value) => value.token!);
    var useridd =
        await authService.getUserRealData().then((value) => value.id!);
    if (utoken == null || utoken.isEmpty) {
      setState(() {
        token = "";
      });
    } else {
      setState(() {
        token = utoken;
        userId = useridd;
      });
    }
  }
  // late Future<bool> IsEditDone;
  //late Future<EditAppiontmentResponseModel> editResponse;
  // String chnageTime(String time) {
  //   var chartochkk = time.substring(time.length - 2);
  //   if (chartochkk.startsWith("A")) {
  //     return time.substring(0, 6) + "ص";
  //   }
  //   if (chartochkk.startsWith("P")) {
  //     return time.substring(0, 6) + "م";
  //   } else {
  //     return time;
  //   }
  // }

  void showBarEdit(BuildContext context) {
    showTopSnackBar(
      context,
      const CustomSnackBar.success(
        backgroundColor: Color(0xffE3E7F1),
        message: "تمت التعديل بنجاح ",
        textStyle: TextStyle(color: Colors.black),
      ),
    );
    setState(() {
      listofModel = getListOfAppiontment(userId);
    });
  }

  void setDateForDate(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime.now().add(const Duration(days: 60)),
      onConfirm: (date) {
        setState(() {
          SelectedDate = DateFormat("yyyy-MM-dd").format(date);
        });
        setTimeForDate(context);
      },
      onCancel: () {
        setState(() {
          SelectedDate = canceledDate;
        });
      },
      currentTime: currentDate,
      locale: LocaleType.ar,
    );
  }

  void setTimeForDate(BuildContext context) {
    DatePicker.showTime12hPicker(context,
        showTitleActions: true, locale: LocaleType.ar,
        //   onCancel: () {
        //   setState(() {
        //     SelectedDate = canceledDate;
        //   });
        // },
        onCancel: () {
      setState(() {
        SelectedTime = canceledTime;
      });
    }, onConfirm: (date) async {
      setState(() {
        SelectedTime = DateFormat("hh:mm a").format(date);
      });
      debugPrint(SelectedTime);
      await apiCall(context);
    }, currentTime: DateTime.now());
  }

  Future<void> apiCall(BuildContext context) async {
    // setState(() {
    //editResponse = editAppiontemnt(SelectedTime, SelectedDate, selectedAppId);
    var rrr = await editAppiontemnt(SelectedTime, SelectedDate, selectedAppId)
        .then((value) => value.isSucceed);
    // var xxx = Future.value(rrr);
    // IsEditDone = editResponse.then((value) => value.isSucceed!);
    // var dd = rrr.then((value) => value.isSucceed);
    // debugPrint(rrr.toString());
    debugPrint(rrr!.toString());
    //  });

    if (rrr == true) {
      showBarEdit(context);
    }
  }

  @override
  initState() {
    super.initState();
    token = "";

    Future.delayed(const Duration(microseconds: 50));
    super.initState();
    Future.delayed(const Duration(microseconds: 50));
    mapUserLoggedInData();

    // SelectedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // SelectedTime = DateFormat("hh:mm a").format(DateTime.now());
    // SelectedTime = chnageTime(SelectedTime);
    listofModel = getListOfAppiontment(5);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: listofModel,
        builder: (context, AsyncSnapshot<List<AppiontmentListModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                  child: Center(
                child: Text("no data"),
              ));
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Center(child: Text(""));
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 120.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffBDC6D9),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(40.0))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textDirection: ui.TextDirection.rtl,
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "التاريخ",
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              snapshot.data![index]
                                                  .dateOfAppiontment!,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "الوقت",
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              snapshot.data![index]
                                                  .timeOfAppiontment!,
                                              textDirection:
                                                  ui.TextDirection.rtl,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              snapshot.data![index].status!,
                                              style: const TextStyle(
                                                  color: Colors.deepOrange,
                                                  fontWeight: FontWeight.bold),
                                              textDirection:
                                                  ui.TextDirection.rtl,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Center(
                                      child: Text("ssss"),
                                    ),
                                    IconButton(
                                      splashRadius: 20.0,
                                      onPressed: () {
                                        debugPrint(snapshot
                                            .data![index].appiontmentId
                                            .toString());
                                        debugPrint(snapshot
                                            .data![index].dateOfAppiontment);
                                        debugPrint(snapshot
                                            .data![index].timeOfAppiontment);
                                        var dd = snapshot
                                            .data![index].dateOfAppiontment!;
                                        debugPrint(
                                            DateTime.parse(dd).toString());

                                        setState(() {
                                          selectedAppId = snapshot
                                              .data![index].appiontmentId!;
                                          currentDate = DateTime.parse(snapshot
                                              .data![index].dateOfAppiontment!);
                                          canceledDate = snapshot
                                              .data![index].dateOfAppiontment!;
                                          // currenttTime = DateTime.parse(
                                          //     snapshot.data![index]
                                          //         .timeOfAppiontment!);
                                          canceledTime = snapshot
                                              .data![index].timeOfAppiontment!;
                                        });

                                        setDateForDate(context);
                                      },
                                      icon: const Icon(
                                        Icons.edit_calendar,
                                        size: 25,
                                        color: Color(0xff52688F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      );
                    });
              }
          }
        });
  }
}

// class TClip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = size.width;
//     double h = size.height;
//     var path = Path();
//     path.lineTo(0, h);
//     // path.lineTo(0, h/2);
//     // path.lineTo(0, 3*h/4);
//     // path.lineTo(0, h);
//     // path.lineTo(w, h);
//    path.quadraticBezierTo(w / 4, h/2 , w/2, h);
//    path.quadraticBezierTo(w - (w/2), h , w, h);
//     path.lineTo(w, 0);
//     path.close();
//     // Path path = new Path();
//     // final lowPoint = size.height - 20;
//     // final highPoint = size.height - 40;

//     // path.lineTo(0, size.height);
//     // path.quadraticBezierTo(
//     //     size.width / 4, highPoint, size.width / 2, lowPoint);
//     // path.quadraticBezierTo(
//     //     3 / 4 * size.width, size.height, size.width, lowPoint);
//     // path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
