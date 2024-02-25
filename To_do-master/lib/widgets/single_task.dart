import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_color.dart';
import 'package:todo_app/constants/styles.dart';

class SingleTask extends StatelessWidget {
  String? title;
  String? subtitle;
  String? date;
  String? status;
  void Function()? onTap;
  SingleTask({super.key, this.onTap,this.title, this.subtitle, this.date, this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  children: [
                    Expanded(
                        flex: 8,
                        child: Text(
                          title ?? "",
                          style: basicStyle.copyWith(fontSize: 17),
                        )),
                     Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.more_horiz,size: 24,color: Colors.grey.shade400,),
                          ],
                        ))
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      subtitle ?? "",
                      style: unselectedStyle.copyWith(color: subTitleColor,fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              const WidgetSpan(
                                  child: Icon(
                                Icons.access_time_rounded,
                                size: 16,
                                color: Color(0xFF7D89B0),
                              )),
                              TextSpan(
                                  text: " $date",
                                  style: unselectedStyle.copyWith(fontSize: 15))
                            ])),
                        Chip(
                            backgroundColor: status.toString() == "Over Due"
                                ? Colors.red.withOpacity(0.3)
                                : Colors.greenAccent.withOpacity(0.3),
                            label: Text(
                              "$status",
                              style: TextStyle(
                                color: status.toString() == "Over Due"
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
