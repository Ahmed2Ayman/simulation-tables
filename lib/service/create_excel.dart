import 'dart:io';
import 'dart:math';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../pages/home_page.dart';

final Workbook workbook = Workbook();
final Worksheet sheet1 = workbook.worksheets[0];
Future<void> createExcel() async {
  serID();
  service();
  serviceDuration();
  customerNumber();
  interArrival();
  arrivalTime();
  serviceCode();
  serviceTitle();
  servicBegin();
  serviceTime();
  serviceEnd();
  systemState();
  customerState();

  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  final String path = (await getApplicationSupportDirectory()).path;
  final String fileName = '$path/output2.xlsx';
  final File file = File(fileName);
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open(fileName);
}

void serID() {
  sheet1.getRangeByName('M1').setText("Ser.ID");
  for (int i = 2; i <= 8; i++) {
    sheet1.getRangeByName("M$i").setText('${i - 1}');
  }
}

void service() {
  sheet1.getRangeByName('N1').setText("Service");
  sheet1.getRangeByName('N2').setText("Open");
  sheet1.getRangeByName("N3").setText('Delete');
  sheet1.getRangeByName("N4").setText('Deposite');
  sheet1.getRangeByName("N5").setText('WithDraw');
  sheet1.getRangeByName("N6").setText('Transfer');
  sheet1.getRangeByName("N7").setText('Inquiry');
  sheet1.getRangeByName("N8").setText('Report');
}

void serviceDuration() {
  sheet1.getRangeByName('O1').setText("ServiceDuration");
  sheet1.getRangeByName('O2').setText("${10}");
  sheet1.getRangeByName("O3").setText('${15}');
  sheet1.getRangeByName("O4").setText('${5}');
  sheet1.getRangeByName("O5").setText('${7}');
  sheet1.getRangeByName("O6").setText('${8}');
  sheet1.getRangeByName("O7").setText('${3}');
  sheet1.getRangeByName("O8").setText('${4}');
}

void customerNumber() {
  sheet1.getRangeByName('A1').setText("customer");
  for (int i = 2; i <= usersNumber! + 1; i++) {
    sheet1.getRangeByName("A$i").setText('${i - 1}');
  }
}

Random random = Random();
void interArrival() {
  sheet1.getRangeByName('B1').setText("Interarrival");

  for (int i = 2; i <= usersNumber! + 1; i++) {
    int number = random.nextInt(10);
    sheet1.getRangeByName("B$i").setText('$number');
  }
}

Future<void> arrivalTime() async {
  sheet1.getRangeByName('C1').setText("Arrival Time");
  sheet1.getRangeByName('C2').setText("${0}");
  for (int i = 3; i <= usersNumber! + 1; i++) {
    int prev = int.parse(sheet1.getRangeByName('C${i - 1}').getText()!);
    int numInB = int.parse(sheet1.getRangeByName('B${i - 1}').getText()!);
    sheet1.getRangeByName('C$i').setText('${prev + numInB}');
  }
}

void serviceCode() {
  sheet1.getRangeByName('D1').setText("code");
  for (int i = 2; i <= usersNumber! + 1; i++) {
    int number = random.nextInt(7);
    if (number == 0) {
      number++;
      sheet1.getRangeByName("D$i").setText('$number');
    }
    sheet1.getRangeByName("D$i").setText('$number');
  }
}

Future<void> serviceTitle() async {
  sheet1.getRangeByName('E1').setText("title");

  for (int i = 2; i <= usersNumber! + 1; i++) {
    sheet1
        .getRangeByName('E$i')
        .setFormula('=LOOKUP(D$i,\$M\$2:\$M\$8,\$N\$2:\$N\$8)');
  }
}

Future<void> servicBegin() async {
  sheet1.getRangeByName('F1').setText("Service Begin");
  sheet1.getRangeByName("F2").setText('${0}');
  for (int i = 3; i <= usersNumber! + 1; i++) {
    sheet1.getRangeByName("F$i").setFormula('=MAX(H${i - 1},C$i)');
  }
}

void serviceTime() {
  sheet1.getRangeByName('G1').setText("Service Duration");
  for (int i = 2; i <= usersNumber! + 1; i++) {
    sheet1
        .getRangeByName('G$i')
        .setFormula('=LOOKUP(D$i,\$M\$2:\$M\$8,\$O\$2:\$O\$8)');
  }
}

Future<void> serviceEnd() async {
  sheet1.getRangeByName('H1').setText("Service End");
  for (int i = 2; i <= usersNumber! + 1; i++) {
    sheet1.getRangeByName("H$i").setFormula('F$i+G$i');
  }
}

void systemState() {
  sheet1.getRangeByName('I1').setText("systemState");
  sheet1.getRangeByName('I2').setText("Busy");
  for (int i = 3; i <= usersNumber! + 1; i++) {
    sheet1
        .getRangeByName("I$i")
        .setFormula('IF(F$i>H${i - 1},F$i-H${i - 1},"busy")');
  }
}

void customerState() {
  sheet1.getRangeByName('J1').setText("customerState");
  sheet1.getRangeByName('J2').setText("inService");
  for (int i = 3; i <= usersNumber! + 1; i++) {
    sheet1.getRangeByName("J$i").setFormula('IF(C$i<F$i,C$i-F$i,"inService")');
  }
}
