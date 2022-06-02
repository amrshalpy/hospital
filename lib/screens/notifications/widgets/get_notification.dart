import 'package:flutter/material.dart';
import 'package:hms/screens/notifications/notification_model.dart';

Widget getNotification(NotificationModel model) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 3,
    child: Container(
      height: 90,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 60,
                    child: Image.asset(
                      '${model.img}',
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.title}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          
                          Container(
                            child: Row(
                              children: [
                                const Icon(Icons.alarm),
                                Text(
                                  '${model.date}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          '${model.body}',
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            height: .8,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            )
          ],
        ),
      ),
    ),
  );
}
