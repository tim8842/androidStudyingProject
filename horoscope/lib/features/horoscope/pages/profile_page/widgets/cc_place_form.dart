import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class CcPlaceForm extends StatefulWidget {
  const CcPlaceForm({super.key});

  @override
  _CcPlaceFormState createState() => _CcPlaceFormState();
}

class _CcPlaceFormState extends State<CcPlaceForm> {
  @override
  Widget build(BuildContext context) {
    String countryValue;
    String stateValue;
    String cityValue;

    return Column(
      children: [
        SelectState(
          // style: TextStyle(color: Colors.red),
          style: Theme.of(context).textTheme.bodyMedium,

          onCountryChanged: (value) {
            setState(() {
              countryValue = value;
            });
          },
          onStateChanged: (value) {
            setState(() {
              stateValue = value;
            });
          },
          onCityChanged: (value) {
            setState(() {
              cityValue = value;
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
