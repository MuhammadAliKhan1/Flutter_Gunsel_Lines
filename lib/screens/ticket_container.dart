import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:gunsel/screens/select_seat.dart';

final Color gunselColor = Color(0xff035EA7);

class TicketContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TicketContainerState();
  }
}

class TicketContainerState extends State<TicketContainer> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SelectSeat()));
        },
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: Ticket(
                  side: BorderSide(
                    color: gunselColor,
                  ),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: 80.0,
                    padding: EdgeInsets.only(left: 5.0, right: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TimeBoard(
                          time: Text('08:05'),
                          label: Text('DEPARTURE'),
                          date: Text('14.08.2019'),
                          annotation: Text('0 seats'),
                        ),
                        TimeBoard(
                          time: Text('14:30'),
                          label: Text('ARRIVAL'),
                          date: Text('14.08.2019'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12.0),
                          color: Colors.grey.shade200,
                          width: 1.0,
                        ),
                        Bus(
                          number: Text('480'),
                          code: Text('UAH'),
                          type: Text('MAN Fortuna (32 seats)'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: gunselColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                      ),
                      width: 18.0,
                      child: Text(
                        'i',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeBoard extends StatelessWidget {
  TimeBoard({
    this.time,
    this.label,
    this.date,
    this.annotation,
  });
  final Widget time;
  final Widget label;
  final Widget date;
  final Widget annotation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Cell(
            time,
            TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900),
            30.0),
        Cell(label, TextStyle(fontSize: 10.0, color: Colors.black), 10.0),
        Cell(date, TextStyle(fontSize: 10.0, color: Colors.black), 10.0),
        Cell(annotation, TextStyle(fontSize: 10.0, color: Colors.blue.shade800),
            10.0),
      ],
    );
  }
}

class Bus extends StatelessWidget {
  Bus({
    this.number,
    this.code,
    this.type,
  });
  final Widget number;
  final Widget code;
  final Widget type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Cell(
            number,
            TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900),
            40.0),
        Cell(code, TextStyle(fontSize: 14.0, color: Colors.black), 14.0),
        Cell(type, TextStyle(fontSize: 10.0, color: Colors.grey), 10.0),
      ],
    );
  }
}

class Cell extends StatelessWidget {
  Cell(this.child, this.textStyle, this.height);
  final Widget child;
  final TextStyle textStyle;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: SizedBox(
        height: height,
        child: child == null
            ? null
            : DefaultTextStyle.merge(
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                textAlign: TextAlign.center,
                child: child,
              ),
      ),
    );
  }
}

class Ticket extends ShapeBorder {
  const Ticket({
    this.side = BorderSide.none,
    this.notchRadius = 8.0,
  })  : assert(side != null),
        assert(notchRadius != null);

  final BorderSide side;
  final double notchRadius;

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(side.width);
  }

  @override
  ShapeBorder scale(double t) {
    return Ticket(
      side: side.scale(t),
      notchRadius: notchRadius * t,
    );
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    assert(t != null);
    if (a is Ticket) {
      return Ticket(
        side: BorderSide.lerp(a.side, side, t),
        notchRadius: lerpDouble(a.notchRadius, notchRadius, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    assert(t != null);
    if (b is Ticket) {
      return Ticket(
        side: BorderSide.lerp(side, b.side, t),
        notchRadius: lerpDouble(notchRadius, b.notchRadius, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    rect = rect.deflate(math.min(rect.shortestSide / 2.0, side.width));
    final double effectiveRadius =
        math.min(math.min(notchRadius, rect.height / 4.0), rect.width / 2.0);
    final Size cornerSize = Size(effectiveRadius * 2.0, effectiveRadius * 2.0);
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..arcTo(Offset(rect.right - effectiveRadius * 2.0, rect.top) & cornerSize,
          -math.pi / 2.0, math.pi / 2.0, false)
      ..arcTo(
          Rect.fromCircle(center: rect.centerRight, radius: effectiveRadius),
          -math.pi / 2.0,
          -math.pi,
          false)
      ..arcTo(
          Offset(rect.right - effectiveRadius * 2.0,
                  rect.bottom - effectiveRadius * 2.0) &
              cornerSize,
          0.0,
          math.pi / 2.0,
          false)
      ..arcTo(
          Offset(rect.left, rect.bottom - effectiveRadius * 2.0) & cornerSize,
          math.pi / 2.0,
          math.pi / 2.0,
          false)
      ..arcTo(Rect.fromCircle(center: rect.centerLeft, radius: effectiveRadius),
          math.pi / 2.0, -math.pi, false)
      ..arcTo(Offset(rect.left, rect.top) & cornerSize, math.pi, math.pi / 2.0,
          false)
      ..close();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    if (rect.isEmpty) return;
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        final Path path = getOuterPath(rect, textDirection: textDirection)
          ..addPath(
              getInnerPath(rect, textDirection: textDirection), Offset.zero)
          ..fillType = PathFillType.evenOdd;
        canvas.drawPath(path, side.toPaint()..style = PaintingStyle.fill);
        break;
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final Ticket typedOther = other;
    return side == typedOther.side && notchRadius == typedOther.notchRadius;
  }

  @override
  int get hashCode => hashValues(side, notchRadius);

  @override
  String toString() {
    return '$runtimeType($side, $notchRadius)';
  }
}
