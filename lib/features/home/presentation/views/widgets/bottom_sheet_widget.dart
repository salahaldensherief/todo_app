import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/widgets/custom_text_form_field.dart';

import '../../../../../core/widgets/custom_table_clender.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTaskForm();
  }
}

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, des;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        decoration: BoxDecoration(
borderRadius: BorderRadius.circular(16),

color: Colors.white24
        ),
        height: 400,

        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add New Task',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Spacer(),
              CustomTextFormField(

                  onSaved: (value){
                  title = value;
                  },
                  hintText: 'Title'),
              Spacer(),
              CustomTextFormField(
                  onSaved: (value){
                    des = value;
                  },
                  hintText: 'Description', lines: 4),
              Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: FloatingActionButton(
                  child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 25),),
                  backgroundColor: AppColors.secandColor,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 4),
                  ),
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                    }else{
                      autovalidateMode =AutovalidateMode.always;
                      setState(() {

                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
