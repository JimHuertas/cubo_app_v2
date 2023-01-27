import 'package:flutter/material.dart';

Future<void> showAlertDialogNewCategory(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (_) => _buildAlertDialog(context),
  );
}

Widget _buildAlertDialog(BuildContext context){
  return AlertDialog(
    insetPadding: EdgeInsets.zero,
    contentPadding: const EdgeInsets.only(top: 10.0),
    title: const Text(
      'Seleccione un puzzle',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    actions: const <Widget>[],
    content: Builder(
      builder:(context){
        return Container(
          color: Colors.red,
          width: (MediaQuery.of(context).size.width < 400) 
              ? MediaQuery.of(context).size.width-50 
              : 400,
          height: 300,
          child: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
        );
      } 
    ),
  );
}