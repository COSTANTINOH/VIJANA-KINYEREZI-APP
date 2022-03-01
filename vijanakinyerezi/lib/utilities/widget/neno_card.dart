import 'package:flutter/material.dart';
import 'color.dart';
import 'text_style.dart';
import '../models/event_model.dart';
import '../constants/datetime_utils.dart';
import 'ui_helper.dart';

class NenoCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  const NenoCard({Key? key, required this.event, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 1,
          child: Row(
            children: <Widget>[
              buildImage(),
              buildEventInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: imgBG,
        width: 80,
        height: 100,
        child: Hero(
          tag: event.image + "1",
          child: Image.network(
            event.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DateTimeUtils.getFullDate(event.eventDate), style: monthStyle),
          UIHelper.verticalSpace(8),
          Text(event.name, style: titleStyle),
          UIHelper.verticalSpace(8),
        ],
      ),
    );
  }
}
