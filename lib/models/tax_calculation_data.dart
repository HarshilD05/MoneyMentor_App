class TaxCalculationData {
  // Salary Inputs
  int basic;
  int hra;
  int lta;
  int da;
  int bonus;
  int otherAllowances;

  // Deductions
  // Section 80C
  int ppf;
  int elss;
  int nsc;
  int epf;
  int homeLoanPrinciple80C;

  int medicalPremiums; // Section 80D
  int educationLoanInterest; // Section 80E
  int nps; // Section 80CCD(1B)
  int savingsAccountInterest; // Section 80TTA
  int homeLoanInterest24B; // Section 24B
  bool metroPolitanCity = true; // To Set Limit on HRA Exemption
  double rentPaid; // To Calculate HRA Exemption
  double hraExemption = 0; // Section 10(13A)

  int stdDeduction = 50000; // Standard Deduction

  // Final Display Values
  double taxableSalary = 0;
  double taxOldRegime = 0;
  double taxNewRegime = 0;

  TaxCalculationData(
      {this.basic = 0,
      this.hra = 0,
      this.lta = 0,
      this.da = 0,
      this.bonus = 0,
      this.otherAllowances = 0,
      this.ppf = 0,
      this.elss = 0,
      this.nsc = 0,
      this.epf = 0,
      this.homeLoanPrinciple80C = 0,
      this.medicalPremiums = 0,
      this.educationLoanInterest = 0,
      this.nps = 0,
      this.savingsAccountInterest = 0,
      this.homeLoanInterest24B = 0,
      this.rentPaid = 0});

  int calculateGrossSalary() {
    return basic + da + hra + lta + bonus + otherAllowances;
  }

  int calculate80CDeductions() {
    int sum80C = ppf + elss + nsc + epf + homeLoanPrinciple80C;
    return sum80C > 150000 ? 150000 : sum80C;
  }

  double calculateTotalDeductions() {
    return calculate80CDeductions() +
        stdDeduction +
        medicalPremiums +
        educationLoanInterest +
        nps +
        savingsAccountInterest +
        homeLoanInterest24B +
        hraExemption;
  }

  double calculateTaxableSalary() {
    taxableSalary = (calculateGrossSalary() - calculateTotalDeductions());
    return taxableSalary;
  }

  
  void calculateHRAexemption() {
    double rentPaid = this.rentPaid;
    int basicDA = (basic + da);
    double hraLimit = metroPolitanCity ? basicDA * 0.5 : basicDA * 0.4;
    double rentMinus10Percent = rentPaid - basicDA * 0.1;
    rentMinus10Percent = rentMinus10Percent < 0 ? 0 : rentMinus10Percent;

    // print("BasicDa : $basicDA");
    // print("HRA Limit : $hraLimit");
    // print("Rent Minus 10% : $rentMinus10Percent");

    hraExemption = hra < hraLimit
        ? hra < rentMinus10Percent
            ? hra as double
            : rentMinus10Percent
        : hraLimit < rentMinus10Percent
            ? hraLimit
            : rentMinus10Percent;
  }

  void calculateTaxOldRegime() {
    const int firstSlab = 250000;
    const int secondSlab = 300000;
    const int thirdSlab = 500000;
    const int fourthSlab = 1000000;

    if (taxableSalary <= firstSlab) {
      taxOldRegime = 0;
      return;
    }
    if (taxableSalary <= secondSlab) {
      taxOldRegime = (taxableSalary - firstSlab) * 0.05;
      return;
    }
    if (taxableSalary <= thirdSlab) {
      taxOldRegime =
          (secondSlab - firstSlab) * 0.05 + (taxableSalary - secondSlab) * 0.05;
      return;
    }
    if (taxableSalary <= fourthSlab) {
      taxOldRegime = (secondSlab - firstSlab) * 0.05 +
          (thirdSlab - secondSlab) * 0.05 +
          (taxableSalary - thirdSlab) * 0.2;
      return;
    } else {
      taxOldRegime = (secondSlab - firstSlab) * 0.05 +
          (thirdSlab - secondSlab) * 0.05 +
          (fourthSlab - thirdSlab) * 0.2 +
          (taxableSalary - fourthSlab) * 0.3;
    }
  }

  void calculateTaxNewRegime() {
    const int firstSlab = 300000;
    const int secondSlab = 600000;
    const int thirdSlab = 900000;
    const int fourthSlab = 1200000;
    const int fifthSlab = 1500000;

    double taxableSalaryNewRegime = calculateGrossSalary() as double;

    if (taxableSalaryNewRegime <= firstSlab) {
      taxNewRegime = 0;
      return;
    }
    if (taxableSalaryNewRegime <= secondSlab) {
      taxNewRegime = (taxableSalaryNewRegime - firstSlab) * 0.05;
      return;
    }
    if (taxableSalaryNewRegime <= thirdSlab) {
      taxNewRegime =
          (secondSlab - firstSlab) * 0.05 + (taxableSalaryNewRegime - secondSlab) * 0.1;
      return;
    }
    if (taxableSalaryNewRegime <= fourthSlab) {
      taxNewRegime = (secondSlab - firstSlab) * 0.05 +
          (thirdSlab - secondSlab) * 0.1 +
          (taxableSalaryNewRegime - thirdSlab) * 0.15;
      return;
    }
    if (taxableSalaryNewRegime <= fifthSlab) {
      taxNewRegime = (secondSlab - firstSlab) * 0.05 +
          (thirdSlab - secondSlab) * 0.1 +
          (fourthSlab - thirdSlab) * 0.15 +
          (taxableSalaryNewRegime - fourthSlab) * 0.2;
      return;
    } else {
      taxNewRegime = (secondSlab - firstSlab) * 0.05 +
          (thirdSlab - secondSlab) * 0.1 +
          (fourthSlab - thirdSlab) * 0.15 +
          (fifthSlab - fourthSlab) * 0.2 +
          (taxableSalaryNewRegime - fifthSlab) * 0.3;
    }
  }

}
