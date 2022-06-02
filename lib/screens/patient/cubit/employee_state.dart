abstract class EmployeeState {}

class EmployeeInitailState extends EmployeeState {}

class IncreasePage extends EmployeeState {}

class FetchData extends EmployeeState {}

class CreateNewEmployeeLoading extends EmployeeState {}

class CreateNewEmployeeSucsses extends EmployeeState {}

class CreateNewEmployeeError extends EmployeeState {}

class DeleteEmployeeLoading extends EmployeeState {}

class DeleteEmployeeSucsses extends EmployeeState {}

class DeleteEmployeeError extends EmployeeState {}

class GetEmployeeLoading extends EmployeeState {}

class GetEmployeeSucsses extends EmployeeState {}

class GetEmployeeError extends EmployeeState {}

class GetEmployeeDetailsLoading extends EmployeeState {}

class GetEmployeeDetailsSucsses extends EmployeeState {}

class GetEmployeeDetailsError extends EmployeeState {}

class UpdateEmployeeDetailsLoading extends EmployeeState {}

class UpdateEmployeeDetailsSucsses extends EmployeeState {}

class UpdateEmployeeDetailsError extends EmployeeState {}
