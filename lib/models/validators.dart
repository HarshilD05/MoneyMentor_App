// Validate the Deduction Input Fields

// NPS : Section 80CCD(1B) - Max 50,000
import 'package:moneymentor/models/tax_calculation_data.dart';

String? validate80CCDdeduction(String? value) {
  if (int.parse(value!) > 50000) {
    return "80CCD deduction cannot exceed 50,000";
  }
  return null;
}

// Medical Premiums : Section 80D - Max 25,000
String? validate80Ddeduction(String? value) {
  int deductVal = int.parse(value!);
  if (deductVal > 75000) {
    return "Medical Premiums deduction cannot exceed 75,000";
  }
  return null;
}

// Saving Account Interest : Section 80TTA - Max 10,000
String? validate80TTAdeduction(String? value) {
  if (int.parse(value!) > 10000) {
    return "Saving Account Interest deduction cannot exceed 10,000";
  }
  return null;
}

// Home Loan Interest : Section 24B - Max 2,00,000
String? validate24Bdeduction(String? value) {
  if (int.parse(value!) > 200000) {
    return "Home Loan Interest deduction cannot exceed 2,00,000";
  }
  return null;
}

// HRA Exemption : Section 10(13A)
String? validateHRAdeduction(int value, TaxCalculationData data) {
  return """
  HRA Exemption is the minimum of the following:
  1. Actual HRA Received : ${data.hra}
  2. ${(data.metroPolitanCity) ? "50% of Basic + DA : ${( (data.basic + data.da)/2).toStringAsFixed(2)}" : "40% of Basic + DA : ${( (data.basic + data.da) * 0.4).toStringAsFixed(2)}" }
  3. Rent Paid ($value) - 10% of Basic + DA : ${(value - (data.basic + data.da) * 0.1).toStringAsFixed(2)}
  """;
}
