import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_appiontment/components/main_button.dart';
import 'package:mobile_appiontment/components/main_input.dart';

class LazorBody extends StatefulWidget {
  const LazorBody({Key? key}) : super(key: key);

  @override
  State<LazorBody> createState() => _LazorBodyState();
}

class _LazorBodyState extends State<LazorBody> {
  bool? isShouldersCheacked = false;
  bool? isUnderarmsCheacked = false;
  bool? isUpperarmsCheacked = false;
  bool? isUpperbackCheacked = false;
  bool? isLowerarmCheacked = false;
  bool? isLowerbackCheacked = false;
  bool? isButtocksCheacked = false;
  bool? isUpperfaceCheacked = false;
  bool? isLowerfaceCheacked = false;
  bool? isNeckCheacked = false;
  bool? isChestCheacked = false;
  bool? isUpperlegsCheacked = false;
  bool? isAbsCheacked = false;
  bool? isLowerlegsCheacked = false;
  bool? isBikiniCheacked = false;
  List<String> bodyPartSelected = [];
  // bool? isCheacked = false;
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "يرجى اختيار مناطق الجسم ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            height: 300,
            //  width: ,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/lazor22.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Container(
              // height: 200,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: SizedBox(
                            height: 60,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                          width: 75,
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.end,
                            spacing: 10,
                            children: [
                              Text(
                                "الكتف",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                    activeColor: Color(0xff52688F),
                                    checkColor: Colors.black,
                                    value: isShouldersCheacked,
                                    onChanged: (val) {
                                      if (val!) {
                                        setState(() {
                                          bodyPartSelected.add("Shoulders");
                                        });
                                      } else {
                                        if (bodyPartSelected
                                            .contains("Shoulders")) {
                                          setState(() {
                                            bodyPartSelected
                                                .remove("Shoulders");
                                          });
                                        }
                                      }
                                      setState(() {
                                        isShouldersCheacked = val;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 13,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: SizedBox(
                            height: 15,
                            width: 75,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.end,
                              spacing: 10,
                              children: [
                                Text(
                                  "الابط",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isUnderarmsCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Underarms");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Underarms")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Underarms");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isUnderarmsCheacked = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            height: 15,
                            width: 75,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  "اليد العليا",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isUpperarmsCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Upper arms");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Upper arms")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Upper arms");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isUpperarmsCheacked = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: SizedBox(
                            height: 15,
                            width: 75,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  "اعلى الظهر",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isUpperbackCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Upper back");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Upper back")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Upper back");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isUpperbackCheacked = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 14, right: 60),
                          child: SizedBox(
                            height: 15,
                            width: 85,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  " اسفل اليد",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isLowerarmCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Lower arms");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Lower arms")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Lower arms");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isLowerarmCheacked = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: SizedBox(
                            height: 15,
                            width: 75,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.end,
                              spacing: 10,
                              children: [
                                Text(
                                  "اسفل الظهر",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isLowerbackCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Lower back");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Lower back")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Lower back");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isLowerbackCheacked = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, right: 95),
                          child: SizedBox(
                            height: 15,
                            width: 55,
                            child: Transform.scale(
                              scaleX: 0.8,
                              scaleY: 0.8,
                              child: Wrap(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.end,
                                spacing: 0,
                                children: [
                                  Text(
                                    "المؤخرة",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Transform.scale(
                                    scale: 0.9,
                                    child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        activeColor: Color(0xff52688F),
                                        checkColor: Colors.black,
                                        value: isButtocksCheacked,
                                        onChanged: (val) {
                                          if (val!) {
                                            setState(() {
                                              bodyPartSelected.add("Buttocks");
                                            });
                                          } else {
                                            if (bodyPartSelected
                                                .contains("Buttocks")) {
                                              setState(() {
                                                bodyPartSelected
                                                    .remove("Buttocks");
                                              });
                                            }
                                          }
                                          setState(() {
                                            isButtocksCheacked = val;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: SizedBox(
                            height: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 15,
                            width: 95,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              spacing: 1,
                              children: [
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isUpperfaceCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Upper face");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Upper face")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Upper face");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isUpperfaceCheacked = val;
                                        });
                                      }),
                                ),
                                Text(
                                  "الوجه الاعلى",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 13,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: SizedBox(
                            height: 15,
                            width: 75,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              spacing: 10,
                              children: [
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isLowerfaceCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Lower face");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Lower face")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Lower face");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isLowerfaceCheacked = val;
                                        });
                                      }),
                                ),
                                Text(
                                  "ألوجه الاسفل ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                          width: 75,
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.start,
                            spacing: 10,
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                    activeColor: Color(0xff52688F),
                                    checkColor: Colors.black,
                                    value: isNeckCheacked,
                                    onChanged: (val) {
                                      if (val!) {
                                        setState(() {
                                          bodyPartSelected.add("Neck");
                                        });
                                      } else {
                                        if (bodyPartSelected.contains("Neck")) {
                                          setState(() {
                                            bodyPartSelected.remove("Neck");
                                          });
                                        }
                                      }
                                      setState(() {
                                        isNeckCheacked = val;
                                      });
                                    }),
                              ),
                              Text(
                                "الرقبة",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                          width: 75,
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.start,
                            spacing: 10,
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                    activeColor: Color(0xff52688F),
                                    checkColor: Colors.black,
                                    value: isChestCheacked,
                                    onChanged: (val) {
                                      if (val!) {
                                        setState(() {
                                          bodyPartSelected.add("Chest");
                                        });
                                      } else {
                                        if (bodyPartSelected
                                            .contains("Chest")) {
                                          setState(() {
                                            bodyPartSelected.remove("Chest");
                                          });
                                        }
                                      }
                                      setState(() {
                                        isChestCheacked = val;
                                      });
                                    }),
                              ),
                              Text(
                                "الصدر",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28),
                          child: SizedBox(
                            height: 15,
                            width: 75,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              spacing: 10,
                              children: [
                                Transform.scale(
                                  scale: 0.7,
                                  child: Checkbox(
                                      activeColor: Color(0xff52688F),
                                      checkColor: Colors.black,
                                      value: isUpperlegsCheacked,
                                      onChanged: (val) {
                                        if (val!) {
                                          setState(() {
                                            bodyPartSelected.add("Upper legs");
                                          });
                                        } else {
                                          if (bodyPartSelected
                                              .contains("Upper legs")) {
                                            setState(() {
                                              bodyPartSelected
                                                  .remove("Upper legs");
                                            });
                                          }
                                        }
                                        setState(() {
                                          isUpperlegsCheacked = val;
                                        });
                                      }),
                                ),
                                Text(
                                  "اعلى الارجل",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                          width: 75,
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.start,
                            spacing: 10,
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                    activeColor: Color(0xff52688F),
                                    checkColor: Colors.black,
                                    value: isAbsCheacked,
                                    onChanged: (val) {
                                      if (val!) {
                                        setState(() {
                                          bodyPartSelected.add("Abs");
                                        });
                                      } else {
                                        if (bodyPartSelected.contains("Abs")) {
                                          setState(() {
                                            bodyPartSelected.remove("Abs");
                                          });
                                        }
                                      }
                                      setState(() {
                                        isAbsCheacked = val;
                                      });
                                    }),
                              ),
                              Text(
                                "السرة و البطن",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15,
                          width: 75,
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.start,
                            // spacing: 10,
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                    activeColor: Color(0xff52688F),
                                    checkColor: Colors.black,
                                    value: isLowerlegsCheacked,
                                    onChanged: (val) {
                                      if (val!) {
                                        setState(() {
                                          bodyPartSelected.add("Lower legs");
                                        });
                                      } else {
                                        if (bodyPartSelected
                                            .contains("Lower legs")) {
                                          setState(() {
                                            bodyPartSelected
                                                .remove("Lower legs");
                                          });
                                        }
                                      }
                                      setState(() {
                                        isLowerlegsCheacked = val;
                                      });
                                    }),
                              ),
                              Text(
                                "اسفل الرجل",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15,
                          width: 75,
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.start,
                            spacing: 10,
                            children: [
                              Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                    activeColor: Color(0xff52688F),
                                    checkColor: Colors.black,
                                    value: isBikiniCheacked,
                                    onChanged: (val) {
                                      if (val!) {
                                        setState(() {
                                          bodyPartSelected.add("Bikini");
                                        });
                                      } else {
                                        if (bodyPartSelected
                                            .contains("Bikini")) {
                                          setState(() {
                                            bodyPartSelected.remove("Bikini");
                                          });
                                        }
                                      }
                                      setState(() {
                                        isBikiniCheacked = val;
                                      });
                                    }),
                              ),
                              Text(
                                "بكيني",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 6, left: 70),
                        //   child: SizedBox(
                        //     height: 15,
                        //     width: 75,
                        //     child: Transform.scale(
                        //       scaleX: 0.8,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Transform.scale(
                        //             scale: 0.8,
                        //             child: Checkbox(
                        //                 activeColor: Color(0xff52688F),
                        //                 checkColor: Colors.black,
                        //                 value: isCheacked,
                        //                 onChanged: (val) {
                        //                   setState(() {
                        //                     isCheacked = val;
                        //                   });
                        //                 }),
                        //           ),
                        //           Text(
                        //             "الراس",
                        //             style: TextStyle(
                        //                 fontSize: 10, fontWeight: FontWeight.bold),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Chip(
          //   label: Text("ddddd"),
          //   backgroundColor: Color(0xff52688F),
          // ),
          // GridView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: myProducts.length % 5 ,
          //     mainAxisExtent: 5,
          //     crossAxisSpacing: 5.0,
          //     mainAxisSpacing: 5.0,
          //   ),
          //   itemCount: myProducts.length,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       color: Colors.blue,
          //       child: Text("index: $index"),
          //     );
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
            child: MainInput(
              linesNo: 3,
              minlinesNo: 1,
              hintText: "التفاصيل",
              controller: _descController,
              // validator: validateEmail,
              icon: const Icon(
                Icons.details_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: MainButton(
                text: "اتمام الحجز",
                onPressed: () {
                  debugPrint(bodyPartSelected.toString());
                }),
          )
        ],
      ),
    );
  }
}
