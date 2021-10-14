import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class SelectDropDownCreate extends StatefulWidget {

  const SelectDropDownCreate({ Key? key, required this.itemsSelect, required this.title}) : super(key: key);

  final List<String> itemsSelect;
  final String title;

  @override
  _SelectDropDownCreateState createState() => _SelectDropDownCreateState();
}

class _SelectDropDownCreateState extends State<SelectDropDownCreate> {

  String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title, 
            style: AppText.input
          ),
          SizedBox(height: 4),
          DropdownButton<String>(
            hint: Text("Selecione..."),
            value: value,
            isExpanded: true,
            iconSize: 30,
            onChanged: (value) =>
              setState(() => this.value = value),
            elevation: 1,
            items: widget.itemsSelect.map(buildMenuItem).toList(),
          ),
        ],
      ),
    );
  }
  
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item, 
      style: AppText.inputText
    )
  );
}