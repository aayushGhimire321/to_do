import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/data.dart';

class TaskDetail extends StatefulWidget {
  dynamic data;
  TaskDetail({super.key, this.data});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  List<String> selected = <String>["1", "2"];
  TextStyle style = GoogleFonts.inter(
      color: const Color(0xFF5D6B98),
      fontWeight: FontWeight.w500,
      fontSize: 17);
  @override
  Widget build(BuildContext context) {
    final dynamic data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Task Details",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Task title", style: style),
              const Icon(Iconsax.edit)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            data['title'],
            style: GoogleFonts.inter(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Due Date",
            style: style,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time_rounded,
                    color: Color(0xFF5D6B98),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "10: 30 AM, 2 Feb 2024",
                    style: GoogleFonts.inter(
                        color: Color(0xFf30374F),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              ),
              Chip(
                  backgroundColor: data['status'].toString() == "Over Due"
                      ? Colors.red.withOpacity(0.3)
                      : Colors.greenAccent.withOpacity(0.3),
                  label: Text(
                    "${data['status']}",
                    style: TextStyle(
                      color: data['status'].toString() == "Over Due"
                          ? Colors.red
                          : Colors.green,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Description",
            style: style,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            data['subtitle'],
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Color(0xFf30374F),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Sub Tasks",
            style: style,
          ),
          const SizedBox(
            height: 20,
          ),
          ...List.generate(subTask.length, (index) {
            var sub = subTask[index];
            return InkWell(
              onTap: () {
                if (selected.contains(sub['id'])) {
                  setState(() {
                    selected.removeAt(index);
                  });
                } else {
                  setState(() {
                    selected.add(sub['id']);
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          sub['title'],
                          style: GoogleFonts.inter(
                              color: index == 3
                                  ? const Color(0xFFD9E1F2)
                                  : const Color(0xFf30374F),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        leading: selected.contains(sub['id'])
                            ? Icon(
                                Icons.check_circle,
                                color: index == 3
                                    ? const Color(0xFFD9E1F2)
                                    : primary,
                                size: 26,
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                size: 26,
                              )),
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
