import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';

class Adddepartment extends StatefulWidget {
  const Adddepartment({Key? key}) : super(key: key);

  @override
  _AdddepartmentState createState() => _AdddepartmentState();
}

class _AdddepartmentState extends State<Adddepartment> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = 'Writer';
  final TextEditingController _branchnameCtrl = TextEditingController();
  final TextEditingController _namectrl = TextEditingController();
  final TextEditingController _sectionNumberctrl = TextEditingController();
  final TextEditingController _lvlctrl = TextEditingController();
  final TextEditingController _suitctrl = TextEditingController();
  final TextEditingController _departmentManagerctrl = TextEditingController();


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
                labelText: 'اسم الفرع',
                controller: _branchnameCtrl,
              ),
              _buildTextField(
                labelText: 'الأسم',
                controller: _namectrl,
              ),
              Center(
                child: _buildTextField(
                  labelText: 'رقم القسم',
                  controller: _sectionNumberctrl,
                ),
              ),
              _buildTextField(
                labelText: 'الدور',
                controller: _lvlctrl,
              ),
              _buildTextField(
                labelText: 'الجناح',
                controller: _suitctrl,
              ),
              _buildTextField(
                labelText: 'رئيس القسم',
                controller: _departmentManagerctrl,
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
                        ),
                      ),
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
      // CoolStep(
      //   title: 'بيانات العنوان ',
      //   subtitle: ' نرجو التاكد من البيانات جيدا',
      //   content: Container(
      //     child: Column(
      //       children: [
      //         _buildTextField(
      //           labelText: 'العنوان',
      //           controller: _address1,
      //         ),
      //         _buildTextField(
      //           labelText: 'رقم المبني',
      //           controller: _address2,
      //         ),
      //         _buildTextField(
      //           labelText: 'الشارع',
      //           controller: _address3,
      //         ),
      //         _buildTextField(
      //           labelText: 'المنطقة',
      //           controller: _address4,
      //         ),
      //         _buildTextField(
      //           labelText: 'المحافظة',
      //           controller: _address5,
      //         ),
      //         _buildTextField(
      //           labelText: 'الموقع',
      //           controller: _address6,
      //         ),
      //       ],
      //     ),
      //     /* child: Row(
      //       children: <Widget>[
      //         _buildSelector(
      //           context: context,
      //           name: 'Writer',
      //         ),
      //         SizedBox(width: 5.0),
      //         _buildSelector(
      //           context: context,
      //           name: 'Editor',
      //         ),
      //       ],
      //     ),*/
      //   ),
      //   validation: () {
      //     return null;
      //   },
      // ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        Fluttertoast.showToast(
            msg: "تم اضافة القسم بنجاح ",
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
          title: Text('اضافة فرع جديد'),
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
