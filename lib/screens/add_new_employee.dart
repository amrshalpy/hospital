import 'package:flutter/material.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/models/employee/employee_provider/employee_provider.dart';
import 'package:hms/models/employees.dart';
import 'package:provider/provider.dart';

class AddNewEmployee extends StatefulWidget {
  AddNewEmployee({Key? key}) : super(key: key);

  @override
  State<AddNewEmployee> createState() => _AddNewEmployeeState();
}

class _AddNewEmployeeState extends State<AddNewEmployee> {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var phoneController = TextEditingController();
  var sallaryController = TextEditingController();
  var exprienceController = TextEditingController();
  var emailController = TextEditingController();
  var birthDayController = TextEditingController();
  var jobController = TextEditingController();
  var phoneNumberSecondController = TextEditingController();
  var specialiationController = TextEditingController();
  var typeIdentificationController = TextEditingController();
  var cerficationDateController = TextEditingController();
  var remeningDayController = TextEditingController();
  var numberIdentificationController = TextEditingController();
  var cerficationDateDayController = TextEditingController();
  var scientificDisciplinesTitelController = TextEditingController();
  var statusProccessController = TextEditingController();
  var addressController = TextEditingController();
  var nameArController = TextEditingController();
  var nameEnController = TextEditingController();

  String? selectedRole = 'Writer';

  String start_date = "تاريخ الانشاء";

  String end_date = "تاريخ التشغيل";

  datePicker(int i) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 15),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (i == 1) {
      start_date = picked.toString().substring(0, 10);
    } else {
      end_date = picked.toString().substring(0, 10);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'البيانات الرئيسية',
        subtitle: ' نرجو التاكد من البيانات جيداً',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              _buildTextField(
                labelText: 'اسم الموظف',
                controller: nameController,
              ),
              _buildTextField(
                labelText: 'الجوال',
                controller: phoneController,
              ),_buildTextField(
                labelText: 'الاسم "عربي"',
                controller: nameArController,
              ),_buildTextField(
                labelText: 'الاسم"انجلبزي"',
                controller: nameEnController,
              ),
              _buildTextField(
                labelText: 'تاريخ الميلاد',
                controller: birthDayController,
              ),
              _buildTextField(
                labelText: 'الوظيفه',
                controller: jobController,
              ),
              _buildTextField(
                labelText: 'الايميل',
                controller: emailController,
              ),
              _buildTextField(
                labelText: 'النوع',
                controller: genderController,
              ),
              _buildTextField(
                labelText: 'الخبره',
                controller: exprienceController,
              ),
              _buildTextField(
                labelText: 'عنوان التخصصات العلمية',
                controller: scientificDisciplinesTitelController,
              ),
              _buildTextField(
                labelText: 'تاريخ الاستقاله',
                controller: remeningDayController,
              ),
              _buildTextField(
                labelText: ' تاريخ التخرج',
                controller: cerficationDateDayController,
              ),
              _buildTextField(
                labelText: 'الراتب',
                controller: sallaryController,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            ' تاريخ التشغيل',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          )),
                      MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 40,
                          color: Colors.black26,
                          onPressed: () async {
                            datePicker(2);
                          },
                          child: new Text(
                            end_date,
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            'تاريخ الانشاء',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          )),
                      MaterialButton(
                          minWidth: MediaQuery.of(context).size.width - 40,
                          color: Colors.black26,
                          onPressed: () async {
                            datePicker(1);
                          },
                          child: new Text(
                            start_date,
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )),
                ],
              )
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'بيانات العنوان ',
        subtitle: ' نرجو التاكد من البيانات جيدا',
        content: Container(
          child: Column(
            children: [
              _buildTextField(
                labelText: 'العنوان',
                controller: addressController,
              ),
              _buildTextField(
                labelText: 'رقم موبايل اخر',
                controller: phoneNumberSecondController,
              ),
              _buildTextField(
                labelText: 'الحاله',
                controller: statusProccessController,
              ),
              _buildTextField(
                labelText: 'التخصص',
                controller: specialiationController,
              ),
              _buildTextField(
                labelText: 'رقم التعريف',
                controller: numberIdentificationController,
              ),
              _buildTextField(
                labelText: 'عنوان التخصصات العلمية',
                controller: scientificDisciplinesTitelController,
              ),
            ],
          ),
          /* child: Row(
            children: <Widget>[
              _buildSelector(
                context: context,
                name: 'Writer',
              ),
              SizedBox(width: 5.0),
              _buildSelector(
                context: context,
                name: 'Editor',
              ),
            ],
          ),*/
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        Provider.of<EmployeeProvider>(context,listen: false).createNewEmployee(
            address: addressController.text,
            nameAr: nameArController.text,
            nameEn: nameArController.text,
            birthDate: birthDayController.text,
            cerficationDate: cerficationDateController.text,
            email: emailController.text,
            exprience: exprienceController.text,
            gender: genderController.text,
            job: jobController.text,
            numberIdentification: numberIdentificationController.text,
            remeningDay: remeningDayController.text,
            sallery: sallaryController.text,
            userName: nameController.text,
            scientificDisciplinesTitel:
                scientificDisciplinesTitelController.text,
            specialiation: specialiationController.text,
            typeIdentification: typeIdentificationController.text);
        if (Provider.of<EmployeeProvider>(context, listen: false).isPage)
          Fluttertoast.showToast(
              msg: "تم اضافة الفرع بنجاح ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

        Navigator.of(context).pop();
      },
      steps: steps,
      config: CoolStepperConfig(
          nextText: "التالي", backText: 'السابق', headerColor: Colors.white),
    );
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kMainColor,
          centerTitle: true,
          title: Text('موظف جديد'),
        ),
        body: Backgroundbottom(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: stepper,
        )));
  }

  Widget _buildTextField({
    String? labelText,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.white10,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black38,
              width: 1.0,
            ),
          ),
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }

  Widget _buildSelector({
    BuildContext? context,
    required String name,
  }) {
    final isActive = name == selectedRole;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (String? v) {
            setState(() {
              selectedRole = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              fontSize: 14,
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
