import 'package:cool_stepper/cool_stepper.dart';
import 'package:day_picker/day_picker.dart';
import 'package:day_picker/model/day_in_week.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hms/components/background.dart';
import 'package:hms/components/backgroundbottom.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/models/Branch.dart';
import 'package:hms/screens/doctors/doctor_provider/doctor_provider.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/state.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:search_choices/search_choices.dart';

class adddoctor extends StatefulWidget {
  const adddoctor({Key? key}) : super(key: key);

  @override
  _adddoctorState createState() => _adddoctorState();
}

class _adddoctorState extends State<adddoctor> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = 'Writer';

  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _address3 = TextEditingController();
  final TextEditingController _address4 = TextEditingController();
  final TextEditingController _address5 = TextEditingController();
  final TextEditingController _address6 = TextEditingController();

  String start_date = "وقت الحضور";
  String end_date = "وقت الانصراف";

  bool asTabs = false;
  String selectedValue = "الاول";
  String preselectedValue = "dolor sit";

  final List<DropdownMenuItem> items = [
    new DropdownMenuItem(child: Text("الاول"))
  ];

  List<DayInWeek> _days = [
    DayInWeek(
      "Sun",
    ),
    DayInWeek(
      "Mon",
    ),
    DayInWeek("Tue", isSelected: true),
    DayInWeek(
      "Wed",
    ),
    DayInWeek(
      "Thu",
    ),
    DayInWeek(
      "Fri",
    ),
    DayInWeek(
      "Sat",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var doctor = Provider.of<DoctorProvider>(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: kMainColor,
              centerTitle: true,
              title: Text('بيانات الطبيب'),
            ),
            body: Backgroundbottom(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            'اسم الطبيب',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          )),
                      _builddropDown(items, "اسم الطبيب", selectedValue),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            'نظام الحضور',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          )),
                      _builddropDown(items, "نظام الحضور", selectedValue),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            'رقم الموظف',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.black38,
                            width: 1,
                          )),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("0001233"),
                            ),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            'ايام العمل',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                          )),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectWeekDays(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            days: _days,
                            border: false,
                            boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [kMainColor, Colors.green],
                                tileMode: TileMode
                                    .repeated, // repeats the gradient over the canvas
                              ),
                            ),
                            onSelect: (values) {
                              // <== Callback to handle the selected days
                              print(values);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 10, left: 10),
                                  child: Text(
                                    'وقت الانصراف',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87),
                                  )),
                              MaterialButton(
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  minWidth:
                                      MediaQuery.of(context).size.width - 40,
                                  color: kMainColor,
                                  onPressed: () async {
                                    showTimePicker(
                                            context: context,
                                            initialTime:
                                                TimeOfDay(hour: 08, minute: 00),
                                            initialEntryMode:
                                                TimePickerEntryMode.dial,
                                            confirmText: "تاكيد",
                                            cancelText: "ليس الان",
                                            helpText: "وقت الحضور")
                                        .then((value) {
                                      setState(() {
                                        end_date = value!.hour.toString() +
                                            ":" +
                                            value.minute.toString();
                                      });
                                    });
                                  },
                                  child: new Text(
                                    end_date,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
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
                                    'وقت الحضور',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87),
                                  )),
                              Container(
                                child: MaterialButton(
                                    elevation: 15,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(80.0)),
                                    minWidth:
                                        MediaQuery.of(context).size.width - 40,
                                    color: kMainColor,
                                    onPressed: () async {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay(
                                                  hour: 08, minute: 00),
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial,
                                              confirmText: "تاكيد",
                                              cancelText: "ليس الان",
                                              helpText: "وقت الانصراف")
                                          .then((value) {
                                        setState(() {
                                          start_date = value!.hour.toString() +
                                              ":" +
                                              value.minute.toString();
                                        });
                                      });
                                    },
                                    child: new Text(
                                      start_date,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                              ),
                            ],
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );

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

  Widget _builddropDown(
      List<DropdownMenuItem> items, String hint, String Selected) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black38,
        width: 1,
      )),
      child: SearchChoices.single(
        underline: SizedBox(),
        items: items,
        value: Selected,
        hint: hint,
        searchHint: "اختيار",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        closeButton: "الغاء",
        doneButton: "اختيار",
        displayItem: (item, selected) {
          return (Row(children: [
            selected
                ? Icon(
                    Icons.radio_button_checked,
                    color: Colors.grey,
                  )
                : Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.grey,
                  ),
            SizedBox(width: 7),
            Expanded(
              child: item,
            ),
          ]));
        },
        isExpanded: true,
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
