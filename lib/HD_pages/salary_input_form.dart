// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moneymentor/HD_pages/deduction_input_form.dart';
// import 'package:moneymentor/models/tax_calculation_data.dart';


// String? validatePositiveInt(String? value) {
//   if (value!.isEmpty) {
//     return 'Please enter a value';
//   }
//   final RegExp regex = RegExp(r'^[0-9]+$');
//   if (!regex.hasMatch(value)) {
//     return 'Please enter a valid non-negative integer';
//   }
//   return "";
// }

// class SalaryComponentsForm extends StatefulWidget {
//   final TaxCalculationData taxCalculationData;
//   const SalaryComponentsForm({super.key, required this.taxCalculationData});

//   @override
//   State<SalaryComponentsForm> createState() => _SalaryComponentsFormState();
// }

// class _SalaryComponentsFormState extends State<SalaryComponentsForm> {
//   // Controllers
//   TextEditingController basicController = TextEditingController();

//   TextEditingController hraController = TextEditingController();

//   TextEditingController ltaController = TextEditingController();

//   TextEditingController bonusController = TextEditingController();

//   TextEditingController otherAllowancesController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Enter Salary Components'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Form(
//             child: Column(
//               children: [
//                 // Basic Salary
//                 Container(
//                   margin: const EdgeInsets.all(15),
//                   child: TextFormField(
//                     controller: basicController,
//                     decoration: const InputDecoration(labelText: 'Basic Salary'),
//                     keyboardType: TextInputType.number,
//                     validator: validatePositiveInt,
//                     onChanged: (String? value) {
//                       setState(() {
//                         widget.taxCalculationData.basic = 
//                           (value!.isEmpty) ? 0 : int.parse(value);
//                       });
//                     },
//                   ),
//                 ),
          
//                 // DA
//                 Container(
//                   margin: const EdgeInsets.all(15),
//                   child: TextFormField(
//                     decoration: const InputDecoration(labelText: 'DA'),
//                     keyboardType: TextInputType.number,
//                     validator: validatePositiveInt,
//                     onChanged: (String? value) {
//                       setState(() {
//                         widget.taxCalculationData.da = (value!.isEmpty) ? 0 : int.parse(value);
//                       });
//                     },
//                   ),
//                 ),
          
//                 // HRA
//                 Container(
//                   margin: const EdgeInsets.all(15),
//                   child: TextFormField(
//                     controller: hraController,
//                     decoration: const InputDecoration(labelText: 'HRA'),
//                     keyboardType: TextInputType.number,
//                     validator: validatePositiveInt,
//                     onChanged: (String? value) {
//                       setState(() {
//                         widget.taxCalculationData.hra = (value!.isEmpty) ? 0 : int.parse(value);
//                       });
//                     },
//                   ),
//                 ),
          
//                 // LTA
//                 Container(
//                   margin: const EdgeInsets.all(15),
//                   child: TextFormField(
//                     controller: ltaController,
//                     decoration: const InputDecoration(labelText: 'LTA'),
//                     keyboardType: TextInputType.number,
//                     validator: validatePositiveInt,
//                     onChanged: (String? value) {
//                       setState(() {
//                         widget.taxCalculationData.lta = (value!.isEmpty) ? 0 : int.parse(value);
//                       });
//                     },
//                   ),
//                 ),
          
//                 // Bonus
//                 Container(
//                   margin: const EdgeInsets.all(15),
//                   child: TextFormField(
//                     controller: bonusController,
//                     decoration: const InputDecoration(labelText: 'Bonus'),
//                     keyboardType: TextInputType.number,
//                     validator: validatePositiveInt,
//                     onChanged: (String? value) {
//                       setState(() {
//                         widget.taxCalculationData.bonus = (value!.isEmpty) ? 0 : int.parse(value);
//                       });
//                     },
//                   ),
//                 ),
          
//                 // Other Allowances
//                 Container(
//                   margin: const EdgeInsets.all(15),
//                   child: TextFormField(
//                     controller: otherAllowancesController,
//                     decoration: const InputDecoration(labelText: 'Other Allowances'),
//                     keyboardType: TextInputType.number,
//                     validator: validatePositiveInt,
//                     onChanged: (String ?value) {
//                       setState(() {
//                         widget.taxCalculationData.otherAllowances =
//                           (value!.isEmpty) ? 0 : int.parse(value);
//                       });
//                     },
//                   ),
//                 ),
          
//                 // Gross Salary Total
//                 Container(
//                   margin: const EdgeInsets.all(15),
//                   child: Row(children: [
//                     const Text('Gross Salary Total: '),
//                     Text(widget.taxCalculationData
//                         .calculateGrossSalary()
//                         .toString()),
//                   ]),
//                 ),
          
//                 // Next Button
//                 ElevatedButton(
//                   onPressed: () {
//                     Get.to(() => DeductionComponentsForm(
//                         taxCalculationData: widget.taxCalculationData));
//                   },
//                   child: const Text(
//                     'Next',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


/////////////////////////

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymentor/HD_pages/deduction_input_form.dart';
import 'package:moneymentor/models/tax_calculation_data.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

String? validatePositiveInt(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a value';
  }
  final RegExp regex = RegExp(r'^[0-9]+$');
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid non-negative integer';
  }
  return "";
}

class SalaryComponentsForm extends StatefulWidget {
  final TaxCalculationData taxCalculationData;
  const SalaryComponentsForm({super.key, required this.taxCalculationData});

  @override
  State<SalaryComponentsForm> createState() => _SalaryComponentsFormState();
}

class _SalaryComponentsFormState extends State<SalaryComponentsForm> {
  // Controllers
  TextEditingController basicController = TextEditingController();

  TextEditingController hraController = TextEditingController();

  TextEditingController ltaController = TextEditingController();

  TextEditingController bonusController = TextEditingController();

  TextEditingController otherAllowancesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Salary Components'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: dark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: [
                        // Basic Salary
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: basicController,
                            decoration: const InputDecoration(
                                labelText: 'Basic Salary'),
                            keyboardType: TextInputType.number,
                            validator: validatePositiveInt,
                            onChanged: (String? value) {
                              setState(() {
                                widget.taxCalculationData.basic =
                                    (value!.isEmpty) ? 0 : int.parse(value);
                              });
                            },
                          ),
                        ),
                        // DA
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: TextFormField(
                            decoration: const InputDecoration(labelText: 'DA'),
                            keyboardType: TextInputType.number,
                            validator: validatePositiveInt,
                            onChanged: (String? value) {
                              setState(() {
                                widget.taxCalculationData.da =
                                    (value!.isEmpty) ? 0 : int.parse(value);
                              });
                            },
                          ),
                        ),
                        // HRA
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: hraController,
                            decoration: const InputDecoration(labelText: 'HRA'),
                            keyboardType: TextInputType.number,
                            validator: validatePositiveInt,
                            onChanged: (String? value) {
                              setState(() {
                                widget.taxCalculationData.hra =
                                    (value!.isEmpty) ? 0 : int.parse(value);
                              });
                            },
                          ),
                        ),

                        // LTA
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: ltaController,
                            decoration: const InputDecoration(labelText: 'LTA'),
                            keyboardType: TextInputType.number,
                            validator: validatePositiveInt,
                            onChanged: (String? value) {
                              setState(() {
                                widget.taxCalculationData.lta =
                                    (value!.isEmpty) ? 0 : int.parse(value);
                              });
                            },
                          ),
                        ),

                        // Bonus
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: bonusController,
                            decoration:
                                const InputDecoration(labelText: 'Bonus'),
                            keyboardType: TextInputType.number,
                            validator: validatePositiveInt,
                            onChanged: (String? value) {
                              setState(() {
                                widget.taxCalculationData.bonus =
                                    (value!.isEmpty) ? 0 : int.parse(value);
                              });
                            },
                          ),
                        ),

                        // Other Allowances
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: TextFormField(
                            controller: otherAllowancesController,
                            decoration: const InputDecoration(
                                labelText: 'Other Allowances'),
                            keyboardType: TextInputType.number,
                            validator: validatePositiveInt,
                            onChanged: (String? value) {
                              setState(() {
                                widget.taxCalculationData.otherAllowances =
                                    (value!.isEmpty) ? 0 : int.parse(value);
                              });
                            },
                          ),
                        ),

                        // Gross Salary Total
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Row(children: [
                            const Text(
                              'Gross Salary Total: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              widget.taxCalculationData
                                  .calculateGrossSalary()
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => DeductionComponentsForm(
                        taxCalculationData: widget.taxCalculationData));
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
