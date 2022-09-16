import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemTask extends StatelessWidget {
  late DateTime dateTime;
  bool _checked = false;

  ItemTask(this.dateTime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatterDate = DateFormat('yyyy-MM-dd');
    final DateFormat formatterTime = DateFormat('jms');

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        // Parte de decoração do item
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.amber[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(4, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task ${formatterDate.format(dateTime)}"),
                  Text(formatterTime.format(dateTime)),
                ],
              ),
              Checkbox(
                value: _checked,
                onChanged: (changed) => {
                  // setState(() {
                  //   _checked = changed!;
                  // },);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
