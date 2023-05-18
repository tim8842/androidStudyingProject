import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class CcPlaceForm extends StatefulWidget {
  const CcPlaceForm({super.key, this.controllers});
  final controllers;

  @override
  _CcPlaceFormState createState() => _CcPlaceFormState();
}

class _CcPlaceFormState extends State<CcPlaceForm> {
  @override
  Widget build(BuildContext context) {
    String countryValue = widget.controllers[0].text;
    String stateValue = widget.controllers[1].text;
    String cityValue = widget.controllers[2].text;

    return Column(
      children: [
        SelectState(
          // style: TextStyle(color: Colors.red),
          style: Theme.of(context).textTheme.bodyMedium,
          defaultCountry: countryValue,
          defaultState: stateValue,
          defaultCity: cityValue,
          onCountryChanged: (value) {
            setState(() {
              widget.controllers[0].text = value;
            });
          },
          onStateChanged: (value) {
            setState(() {
              widget.controllers[1].text = value;
            });
          },
          onCityChanged: (value) {
            setState(() {
              widget.controllers[2].text = value;
            });
          },
        ),
        // InkWell(
        //   onTap:(){
        //     print('country selected is $countryValue');
        //     print('country selected is $stateValue');
        //     print('country selected is $cityValue');
        //   },
        //   child: Text(' Check')
        // )
      ],
    );
  }
}
