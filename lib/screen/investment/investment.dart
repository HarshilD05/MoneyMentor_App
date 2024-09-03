// import 'package:flutter/material.dart';

// void main() {
//   runApp(TaxCalculator());
// }

// class TaxCalculator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tax Calculator',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TaxCalculatorForm(),
//     );
//   }
// }

// class TaxCalculatorForm extends StatefulWidget {
//   @override
//   _TaxCalculatorFormState createState() => _TaxCalculatorFormState();
// }

// class _TaxCalculatorFormState extends State<TaxCalculatorForm> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController basicController = TextEditingController();
//   TextEditingController hraController = TextEditingController();
//   TextEditingController bonusController = TextEditingController();
//   TextEditingController section80CController = TextEditingController();
//   TextEditingController section80DController = TextEditingController();
//   TextEditingController houseLoanController = TextEditingController();

//   double taxableIncome = 0.0;
//   double totalTax = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tax Calculator'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: [
//             TextFormField(
//               controller: basicController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Basic Salary'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter basic salary';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: hraController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'HRA'),
//             ),
//             TextFormField(
//               controller: bonusController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Bonus'),
//             ),
//             TextFormField(
//               controller: section80CController,
//               keyboardType: TextInputType.number,
//               decoration:
//                   InputDecoration(labelText: 'Investment under Section 80C'),
//             ),
//             TextFormField(
//               controller: section80DController,
//               keyboardType: TextInputType.number,
//               decoration:
//                   InputDecoration(labelText: 'Investment under Section 80D'),
//             ),
//             TextFormField(
//               controller: houseLoanController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'House Loan Deduction'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   calculateTax();
//                 }
//               },
//               child: Text('Calculate Tax'),
//             ),
//             SizedBox(height: 20),
//             Text('Taxable Income: $taxableIncome'),
//             Text('Total Tax: $totalTax'),
//           ],
//         ),
//       ),
//     );
//   }

//   void calculateTax() {
//     double basicSalary = double.parse(basicController.text);
//     double hra = double.parse(hraController.text ?? '0' );
//     double bonus = double.parse(bonusController.text ?? '0');
//     double section80C = double.parse(section80CController.text ?? '0');
//     double section80D = double.parse(section80DController.text ?? '0');
//     double houseLoanDeduction = double.parse(houseLoanController.text ?? '0');

//     double grossIncome = basicSalary + hra + bonus;
//     double totalDeductions = section80C + section80D + houseLoanDeduction;
//     double taxableIncome = grossIncome - totalDeductions;

//     // Simple Tax Calculation (for demonstration purpose)
//     double tax = calculateTaxAmount(taxableIncome);

//     setState(() {
//       this.taxableIncome = taxableIncome;
//       this.totalTax = tax;
//     });
//   }

//   double calculateTaxAmount(double income) {
//     // Simple tax calculation formula (for demonstration purpose)
//     if (income <= 250000) {
//       return 0;
//     } else if (income <= 500000) {
//       return (income - 250000) * 0.05;
//     } else if (income <= 1000000) {
//       return 12500 + (income - 500000) * 0.1;
//     } else {
//       return 112500 + (income - 1000000) * 0.15;
//     }
//   }
// }
