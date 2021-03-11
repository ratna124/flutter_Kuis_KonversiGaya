import 'package:flutter/material.dart';

class DropdownConversiBefore extends StatelessWidget {
  const DropdownConversiBefore({
    Key key,
    @required this.listFrom,
    @required this.dropdownOnChangedFrom,
    @required String newValueFrom,
  }) : _newValueFrom = newValueFrom, super(key: key);

  final List<String> listFrom;
  final String _newValueFrom;
  final Function dropdownOnChangedFrom;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: listFrom.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: _newValueFrom,
      onChanged: dropdownOnChangedFrom,
    );
  }
}