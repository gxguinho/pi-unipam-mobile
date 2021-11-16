import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipam_mobile/modules/app/library/authors/authors_controller.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/modal_create/modal_create.dart';

class TablePage extends StatefulWidget {
  const TablePage({ 
    Key? key, 
    required this.title, 
    this.hasSearch = false, 
    this.hasFillter = false, 
    this.hasAdd = false, 
    required this.child, 
    required this.modalTitle, 
    required this.inputs, 
    required this.onChangedText, 
    required this.register, required this.errors, 
    required this.cleanInputs, 
    required this.animation, 
    this.controller,
  }) : super(key: key);

  final String title;
  final bool? hasSearch;
  final bool? hasFillter;
  final bool? hasAdd;
  final Widget child;
  final String modalTitle;
  final List inputs;
  final Function(String, String) onChangedText;
  final Function(BuildContext) register;
  final List errors; 
  final Function() cleanInputs;
  final Listenable animation;
  final String? controller;
  
  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {

  bool isScreaching = false;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: !isScreaching ? Text(widget.title, style: AppText.barTitle) :
            TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar ${widget.title}",
              )
            ),
            actions: [
              widget.hasSearch == true ? 
              IconButton(
                onPressed: () {
                  setState(() {
                    this.isScreaching = !this.isScreaching;
                  });
                }, 
                icon: Icon(
                  !isScreaching ? Icons.search : Icons.cancel,
                  size: 30
                )
              ) : Container(),
              widget.hasFillter == true ? 
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list, 
                  size: 30
                ),
              ) : Container(),
              widget.hasAdd == true ? 
              IconButton(
                onPressed: () => _openModal(
                ), 
                icon: Icon(
                  Icons.add_circle,
                  size: 32
                )
              ) : Container(), 
            ],
          ),
          body: widget.child,
        );
  }
  _openModal() {
    showDialog(
      context: context,
      builder: (context) {
        return ModalCreate(
          title: "Autor",
          inputs: widget.inputs,
          modalTitle: widget.modalTitle,
          register: widget.register,
          onChangedText: widget.onChangedText,
          errors: widget.errors,
          cleanInputs: widget.cleanInputs,
          animation: widget.animation,
          controller: widget.controller,
        );
    });
  }
}