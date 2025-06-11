import 'package:equatable/equatable.dart';

class Budget extends Equatable {
  final double monthlyBudget;
  final DateTime budgetStartDate;

  const Budget({
    required this.monthlyBudget,
    required this.budgetStartDate,
  });

  Budget copyWith({
    double? monthlyBudget,
    DateTime? budgetStartDate,
  }) {
    return Budget(
      monthlyBudget: monthlyBudget ?? this.monthlyBudget,
      budgetStartDate: budgetStartDate ?? this.budgetStartDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'monthlyBudget': monthlyBudget,
      'budgetStartDate': budgetStartDate.toIso8601String(),
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      monthlyBudget: map['monthlyBudget'],
      budgetStartDate: DateTime.parse(map['budgetStartDate']),
    );
  }

  @override
  List<Object> get props => [monthlyBudget, budgetStartDate];
}