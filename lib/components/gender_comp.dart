import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile_appiontment/components/radio_gender.dart';
import 'package:mobile_appiontment/models/gender.dart';

//define callback
typedef StringCallback = void Function(String genderName);

class GenderSelector extends StatefulWidget {
  final StringCallback onSonChanged;

  const GenderSelector({super.key, required this.onSonChanged});

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> genders = <Gender>[];

  @override
  void initState() {
    super.initState();
    genders.add(Gender("ذكر", MdiIcons.genderMale, false));
    genders.add(Gender("انثى", MdiIcons.genderFemale, false));
    // genders.add(new Gender("Others", MdiIcons.genderTransgender, false));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: genders.length,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(60.0),
            splashColor: Colors.blueGrey.shade400,
            onTap: () {
              setState(() {
                genders.forEach((gender) => gender.isSelected = false);
                genders[index].isSelected = true;
                widget.onSonChanged(genders[index].name);
                //debugPrint(genders[index].name);
              });
            },
            child: Container(child: CustomRadio(genders[index])),
          );
        });
  }
}
