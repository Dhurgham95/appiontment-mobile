import 'package:flutter/material.dart';
import 'package:mobile_appiontment/models/gender.dart';

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        // decoration: BoxDecoration(
        //     border: Border.all(),
        //     borderRadius: BorderRadius.all(Radius.circular(60))),
        color: _gender.isSelected
            ? const Color.fromARGB(255, 41, 107, 154)
            : Colors.white,
        child: Container(
          // decoration: BoxDecoration(
          //     border: Border.all(),
          //     borderRadius: BorderRadius.all(Radius.circular(60))),

          width: 100,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                size: 30,
              ),
              const SizedBox(width: 5),
              Text(
                _gender.name,
                style: TextStyle(
                    color: _gender.isSelected ? Colors.white : Colors.grey),
              )
            ],
          ),
        ));
  }
}
