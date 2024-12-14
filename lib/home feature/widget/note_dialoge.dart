import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/app_colors.dart';
import 'package:todo_app/home%20feature/services/cubit/note_cubit.dart';
import 'package:todo_app/home%20feature/widget/circle_avatar_border.dart';

class NoteDialoge extends StatefulWidget {
  final NoteCubit noteCubit;
  const NoteDialoge({
    super.key,
    required this.noteCubit,
  });

  @override
  State<NoteDialoge> createState() => _NoteDialogeState();
}

class _NoteDialogeState extends State<NoteDialoge> {
  late String colorCode;
  Color selectedColor = AppColors.accentColor;
  final color1 = const Color.fromARGB(255, 243, 158, 158);
  final color2 = const Color.fromARGB(255, 227, 245, 151);
  final color3 = const Color.fromARGB(255, 248, 210, 148);
  final color4 = const Color.fromARGB(255, 179, 155, 251);
  final color5 = const Color.fromARGB(255, 133, 182, 245);
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final priorityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    colorCode = selectedColor.value.toRadixString(16).toUpperCase();
  }

  void updateColor(Color color) {
    setState(() {
      selectedColor = color;
      colorCode = selectedColor.value.toRadixString(16).toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add new task',
        style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
      scrollable: true,
      contentPadding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      content: Container(
        height: 350,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'content',
                  hintText: 'do something',
                  hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  fillColor: Colors.transparent,
                  focusColor: Colors.white,
                  hoverColor: const Color.fromARGB(255, 120, 122, 213),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(
                  labelText: 'category',
                  hintText: 'ex: work',
                  hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  fillColor: Colors.transparent,
                  focusColor: Colors.white,
                  hoverColor: const Color.fromARGB(255, 120, 122, 213),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: priorityController,
                decoration: InputDecoration(
                  labelText: 'priority',
                  hintText: 'eg : 1,2,3,4',
                  hintStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  fillColor: Colors.transparent,
                  focusColor: Colors.white,
                  hoverColor: const Color.fromARGB(255, 120, 122, 213),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a priority';
                  } else if (int.parse(value) > 6 || int.parse(value) < 1) {
                    return 'Please enter a priority number from 1 to 6';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      updateColor(color1);
                    },
                    child: CircleAvatarWithBorder(
                      color: color1,
                      isSelected: selectedColor == color1,
                      backgroundColor: color1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateColor(color2);
                    },
                    child: CircleAvatarWithBorder(
                      color: color2,
                      isSelected: selectedColor == color2,
                      backgroundColor: color2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateColor(color3);
                    },
                    child: CircleAvatarWithBorder(
                      color: color3,
                      isSelected: selectedColor == color3,
                      backgroundColor: color3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateColor(color4);
                    },
                    child: CircleAvatarWithBorder(
                      color: color4,
                      isSelected: selectedColor == color4,
                      backgroundColor: color4,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     updateColor(color5);
                    },
                    child: CircleAvatarWithBorder(
                      color: color5,
                      isSelected: selectedColor == color5,
                      backgroundColor: color5,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        MaterialButton(
          color: const Color.fromARGB(255, 242, 35, 35),
          onPressed: () => Navigator.pop(context),
          shape: const StadiumBorder(side: BorderSide()),
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 14),
          ),
        ),
        MaterialButton(
          shape: const StadiumBorder(side: BorderSide()),
          color: AppColors.accentColor,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Validating...'),
                  duration: Duration(seconds: 1),
                ),
              );
              widget.noteCubit.addNewNote(
                content: titleController.text,
                category: categoryController.text,
                priority: priorityController.text.isEmpty
                    ? 1
                    : int.parse(priorityController.text),
                color: colorCode,
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Save', style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
