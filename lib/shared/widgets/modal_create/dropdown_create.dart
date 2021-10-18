import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class DropdownCreate extends StatefulWidget {

  final String title;
  final List<Map<dynamic, dynamic>> itemsSelect;
  final Function(String)? onChanged;
  const DropdownCreate({ Key? key, required this.title, required this.itemsSelect, this.onChanged }) : super(key: key);

  @override
  _DropdownCreateState createState() => _DropdownCreateState();
}

class _DropdownCreateState extends State<DropdownCreate> {


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
            underline: Container(
              height: 2,
              color: value == null ? AppController.instance.colorSelected.withOpacity(0.2) :
              AppController.instance.colorSelected,
            ),
            hint: Text("Selecione..."),
            isExpanded: true,
            iconSize: 30,
            value: value,
            onChanged: (value) => {
              setState(() => this.value = value),
              widget.onChanged!(value!)
            },
            items: widget.itemsSelect.map(buildMenuItem).toList()
          )
        ],
      ),
    );
  }
  
  DropdownMenuItem<String> buildMenuItem(Map<dynamic, dynamic> item) => DropdownMenuItem(
    value: item['value'],
    child: Text(
      item['title'], 
      style: AppText.inputText
    )
  );
}