import 'package:flutter/material.dart';

typedef ListPickerItemBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  T selectedValue,
);

class ListPickerFormField<T> extends FormField<T> {
  ListPickerFormField({
    Key key,
    T initialValue,
    @required List<T> values,
    @required ListPickerItemBuilder<T> itemBuilder,
    @required double height,
  }) : super(
          key: key,
          initialValue: initialValue,
          builder: (field) {
            return SizedBox(
              height: height,
              child: ListPicker(
                  selectedValue: field.value,
                  values: values,
                  onChange: field.didChange,
                  itemBuilder: itemBuilder),
            );
          },
        );
}

class ListPicker<T> extends StatelessWidget {
  final T selectedValue;
  final List<T> values;
  final ValueChanged<T> onChange;
  final ListPickerItemBuilder<T> itemBuilder;

  ListPicker({
    Key key,
    @required this.values,
    @required this.onChange,
    @required this.itemBuilder,
    @required this.selectedValue,
  })  : assert(values != null),
        assert(onChange != null),
        assert(itemBuilder != null),
        assert(selectedValue != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          return GestureDetector(
            onTap: () => onChange(value),
            child: itemBuilder(
              context,
              value,
              selectedValue,
            ),
          );
        },
      ),
    );
  }
}