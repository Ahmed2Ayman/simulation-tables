<<<<<<< HEAD
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _createExcel(context);
//           },
//           child: Text('Create Excel'),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _createExcel(BuildContext context) async {
//     try {
//       final Directory directory = await getApplicationSupportDirectory();
//       if (!directory.existsSync()) {
//         directory.createSync(recursive: true);
//       }
//       final String path = directory.path;
//
//       final Workbook workbook = Workbook();
//       final Worksheet sheet = workbook.worksheets[0];
//       sheet.getRangeByName('A1').setText("Hello");
//       sheet.getRangeByName('B1').setText("World!");
//
//       final List<int> bytes = workbook.saveAsStream();
//       workbook.dispose();
//
//       final String fileName = "$path/output.xlsx";
//       final File file = File(fileName);
//       await file.writeAsBytes(bytes, flush: true);
//
//       // إظهار رسالة نجاح باستخدام ScaffoldMessenger
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Excel file created successfully!')),
//       );
//
//       // فتح الملف المنشأ
//       OpenFile.open(fileName);
//     } catch (e) {
//       // التعامل مع الأخطاء وطباعتها في وحدة التحكم
//       print('Error: $e');
//     }
//   }
// }
=======
>>>>>>> 67fc063 (first commit)

import 'package:simulation_tables/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

