import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// DateFormatで日付を取得
get sentDateFormatted {
  // final String sentDateJst;
  initializeDateFormatting("ja_JP");

  // DateTime datetime = DateTime.parse(sentDateJst); // StringからDate

  // var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
  var formatter = new DateFormat('yyyy/MM/dd', "ja_JP");
  var formatted = formatter.format(DateTime.now()); // DateからString
  return formatted;
}

// 横線を生成
class HorizonalLine extends CustomPainter {
  final horizonalLineLength;
  HorizonalLine(this.horizonalLineLength);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    paint.strokeWidth = 1;
    canvas.drawLine(
      Offset(0, 50),
      Offset(30, 50),
      // Offset(0, 130),
      // Offset(30, 130),
      // Offset(30, 90),
      // Offset(60, 90),

      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// 横線を生成
class HorizonalLine_2 extends CustomPainter {
  final horizonalLineLength;
  HorizonalLine_2(this.horizonalLineLength);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    paint.strokeWidth = 1;
    canvas.drawLine(
      // Offset(30, 90),
      // Offset(60, 90),
      Offset(30, 170),
      Offset(60, 170),
      // Offset(30, 230),
      // Offset(60, 230),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// 縦線を生成
class VerticalLine extends CustomPainter {
  final verticalLineLength;
  VerticalLine(this.verticalLineLength);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    paint.strokeWidth = 1;
    canvas.drawLine(
      Offset(30, 50),
      Offset(30, 130),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
