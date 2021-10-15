import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/Academic/students/students_controller.dart';
import 'package:unipam_mobile/modules/app/app_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';

class SelectDropDownCreate extends StatefulWidget {

  const SelectDropDownCreate({ Key? key, required this.itemsSelect, required this.title, this.onChanged}) : super(key: key);

  final List<Map<dynamic, dynamic>> itemsSelect;
  final Function(String)? onChanged;
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
                underline: Container(
                  height: 2,
                  color: value == null ? AppController.instance.colorSelected.withOpacity(0.2) :
                  AppController.instance.colorSelected,
                ),
                hint: widget.title != "Cidade" ? Text("Selecione...") : Text("Selecione um Estado primeiro ..."),
                value: value,
                isExpanded: true,
                iconSize: 30,
                onChanged: (value) => { 
                  setState(() => this.value = value),
                  widget.onChanged!(value!)
                },
                elevation: 1,
                items: widget.title != "Cidade" ? widget.itemsSelect.map(buildMenuItem).toList() : 
                StudentsController.instance.estado == "" ? null : widget.itemsSelect.map(buildMenuItem).toList(),
              ),
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