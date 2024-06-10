import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Habittile extends StatelessWidget {
  final String name;
  final bool ischecked;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onEdit;
  final void Function(BuildContext)? onDelete;
  const Habittile(
      {super.key,
      required this.ischecked,
      required this.name,
      required this.onChanged,
      this.onEdit,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: onDelete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
          ),
          SlidableAction(
            padding: const EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(20),
            onPressed: onEdit,
            backgroundColor: const Color.fromARGB(255, 81, 78, 223),
            icon: Icons.edit,
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 212, 163, 163),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 80.h,
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.blue,
                value: ischecked,
                onChanged: onChanged,
                checkColor: const Color.fromARGB(255, 245, 248, 245),
              ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
