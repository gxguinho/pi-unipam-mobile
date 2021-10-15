import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:unipam_mobile/shared/themes/app_colors.dart';
import 'package:unipam_mobile/shared/themes/app_text.dart';
import 'package:unipam_mobile/shared/widgets/drawer/drawer_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class NotasPage extends StatefulWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  _NotasPageState createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  late final TextInputType keyboardType;
  String dropDownBotton = 'One';
  final items = [
    'Nota 1',
    'Nota 2',
    'Nota 3',
    'Nota 4',
  ];
  String? value;

  final _Controller = TextEditingController();
  final _Controller2 = TextEditingController();

  List _List = [];

  late Map<String, dynamic> _lastRemoved;
  late int _lastRemovedPos;

  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _List = json.decode(data);
      });
    });
  }

  void _add() {
    setState(() {
      Map<String, dynamic> addList= Map();
     var nota = {
       'Nome' :  _Controller2.text,
       'Nota' : _Controller.text,
     };
      _Controller.text = "";
      _List.add(nota);

      _saveData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notas", style: AppText.barTitle),
        actions: [
          new IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _onButtonPressed(),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                itemCount: _List.length,
                itemBuilder: buildItem),
          )
        ],
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 600,
            child: SingleChildScrollView(
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: _buildBottomNavigationMenu(),
                ),
              ),
            ),
          );
        });
  }

  _buildBottomNavigationMenu() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Insira Uma Nota',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: value,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: _Controller2,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.shape)),
                    ),
                  ),
                
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: TextField(
                  controller: _Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nota',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.shape)),
                  ),
                ),
                ),
                ElevatedButton(
                  onPressed: _add,
                  child: const Text('Enviar'),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.purple,
                    textStyle: AppText.buttonTitle,
                    minimumSize: Size(400, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, int index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white,),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: ListTile(
      title: Text(_List[index]["Nota"]
      ,style: TextStyle(
          fontSize: (20.0),),),
        leading: Text(_List[index]['Nome'],style: TextStyle(
          fontSize: (20.0),
        )),
    ),
      onDismissed: (direction){
        setState(() {
          _lastRemoved = Map.from(_List[index]);
          _lastRemovedPos = index;
          _List.removeAt(index);

          _saveData();

          final snack = SnackBar(
            content: Text("Nota \"${_lastRemoved["title"]}\" removida!"),
            action: SnackBarAction(label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _List.insert(_lastRemovedPos, _lastRemoved);
                    _saveData();
                  });
                }),
            duration: Duration(seconds: 2),
          );

          // ignore: deprecated_member_use
          Scaffold.of(context).removeCurrentSnackBar();
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(snack);

        });
      },
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_List);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null!;
    }
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
