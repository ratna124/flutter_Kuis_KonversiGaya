import 'package:flutter/material.dart';

class DropdownConversi extends StatelessWidget {
  const DropdownConversi({
    Key key,
    @required this.listItem,
    @required this.dropdownOnChanged,
    @required String newValue,
  }) : _newValue = newValue, super(key: key);

  final List<String> listItem;
  final String _newValue;
  final Function dropdownOnChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValue,
      onChanged: dropdownOnChanged,
    );
  }
}