// import 'package:flutter/material.dart';

// String validatePositiveInt(String value) {
//   if (value.isEmpty) {
//     return 'Please enter a value';
//   }
//   final RegExp regex = RegExp(r'^[0-9]+$');
//   if (!regex.hasMatch(value)) {
//     return 'Please enter a valid non-negative integer';
//   }
//   return "";
// }

// class SalaryComponentsForm extends StatefulWidget {
//   @override
//   _SalaryComponentsFormState createState() => _SalaryComponentsFormState();
// }

// class _SalaryComponentsFormState extends State<SalaryComponentsForm> {
//   final TextEditingController _basicController = TextEditingController();
//   final TextEditingController _hraController = TextEditingController();
//   final TextEditingController _ltaController = TextEditingController();
//   final TextEditingController _bonusController = TextEditingController();
//   final TextEditingController _otherAllowancesController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Form(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: _basicController,
//                       decoration: const InputDecoration(
//                         labelText: 'Basic',
//                         prefixIcon: Icon(Icons.abc),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: _hraController,
//                       decoration: const InputDecoration(
//                         labelText: 'HRA',
//                         prefixIcon: Icon(Icons.abc),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: _ltaController,
//                       decoration: const InputDecoration(
//                         labelText: 'LTA',
//                         prefixIcon: Icon(Icons.abc),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: _bonusController,
//                       decoration: const InputDecoration(
//                         labelText: 'Bonus',
//                         prefixIcon: Icon(Icons.abc),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: _otherAllowancesController,
//                       decoration: const InputDecoration(
//                         labelText: 'Other Allowances',
//                         prefixIcon: Icon(Icons.abc),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MultiPageForm extends StatefulWidget {
//   @override
//   _MultiPageFormState createState() => _MultiPageFormState();
// }

// class _MultiPageFormState extends State<MultiPageForm> {
//   int _currentPageIndex = 0;
//   final List<Widget> _pages = [
//     // Add your pages here
//     SalaryComponentsForm(),
//     // Add more pages if needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Multi Page Form'),
//       ),
//       body: _pages[_currentPageIndex],
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: _currentPageIndex > 0
//                   ? () {
//                       setState(() {
//                         _currentPageIndex--;
//                       });
//                     }
//                   : null,
//             ),
//             IconButton(
//               icon: Icon(Icons.arrow_forward),
//               onPressed: _currentPageIndex < _pages.length - 1
//                   ? () {
//                       setState(() {
//                         _currentPageIndex++;
//                       });
//                     }
//                   : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
