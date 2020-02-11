import 'package:flutter/material.dart';

import 'package:self_education/carwash/entities/body_type.dart';
import 'package:self_education/carwash/widgets/body_type_card.dart';
import 'package:self_education/carwash/widgets/list_picker_form_field.dart';

class CarWashServicesScreen extends StatefulWidget {
  @override
  _CarWashServicesScreenState createState() => _CarWashServicesScreenState();
}

class _CarWashServicesScreenState extends State<CarWashServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        centerTitle: true,
      ),
      body: Container(
        child: _buildBodyTypeListView(),
      ),
    );
  }

  Widget _buildBodyTypeListView() {
    return ListPickerFormField(
      height: 112,
      values: _bodyTypesList,
      initialValue: _bodyTypesList.first,
      itemBuilder: (context, carBodyType, selectedCarBodyType) {
        return BodyTypeCard(
          bodyType: carBodyType,
          isSelected: carBodyType == selectedCarBodyType,
        );
      },
    );
  }
}

final _bodyTypesList = <BodyType>[
  BodyType(
    id: 1,
    name: 'Sedan',
    image:
        'https://mycartest.top/api/carwash/images/car_body_types/body_sedan.png',
  ),
  BodyType(
    id: 2,
    name: 'Universal',
    image: 'https://mycartest.top/images/car_body_types/body_universal.png',
  ),
  BodyType(
    id: 3,
    name: 'Jeep',
    image: 'https://mycartest.top/images/car_body_types/body_jeep.png',
  ),
];
