import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFDDFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: FlareActor(
                'assets/flare/loading.flr',
                animation: 'Alarm',
              ),
            ),
            Text(
              'Loading',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}