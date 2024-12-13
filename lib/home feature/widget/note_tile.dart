import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/home%20feature/services/cubit/note_cubit.dart';
import 'package:todo_app/home%20feature/widget/note_dialoge_update.dart';

class NoteTile extends StatefulWidget {
  final int id;
  final Color tileColor;
  final bool isCompleted;
  final String title;
  final int priority;
  final String category;
  const NoteTile({
    super.key,
    required this.tileColor,
    required this.isCompleted,
    required this.title,
    required this.priority,
    required this.category,
    required this.id,
  });

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  late bool isCompleted;
  late String title;
  late int priority;
  late String category;
  late Color darkerColor;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.isCompleted;
    darkerColor = widget.tileColor
        .withRed(widget.tileColor.red - 80)
        .withGreen(widget.tileColor.green - 80)
        .withBlue(widget.tileColor.blue - 100);

    title = widget.title;
    category = widget.category;
    priority = widget.priority;
  }

  @override
  Widget build(BuildContext context) {
    final NoteCubit noteCubit = context.read<NoteCubit>();
    return Slidable(
      closeOnScroll: true,
      dragStartBehavior: DragStartBehavior.start,
      direction: Axis.horizontal,
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            noteCubit.deleteNote(widget.id);
          },
          backgroundColor: const Color.fromARGB(255, 238, 6, 6),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          flex: 3,
        ),
      ]),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: widget.tileColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: darkerColor,
                            decoration: isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor:
                                isCompleted ? darkerColor : Colors.transparent),
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 70,
                            height: 30,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: darkerColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$priority',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                const Icon(
                                  Icons.flag,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 70,
                            height: 30,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                color: darkerColor),
                            child: Text(category,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: isCompleted,
                        onChanged: (bool? value) {
                          setState(() {
                            isCompleted = value!;
                            noteCubit.updateNoteStatus(
                                id: widget.id, updates: isCompleted);
                          });
                        },
                        activeColor: darkerColor,
                        checkColor: Colors.white,
                        side: BorderSide(
                          color: darkerColor,
                          width: 3.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final noteCubit = context.read<NoteCubit>();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                NoteDialogeUpdate(
                                  noteCubit: noteCubit,
                                  id: widget.id,
                                  content: widget.title,
                                  category: widget.category,
                                  priority: widget.priority,
                                  tileColor: widget.tileColor,));
                      },
                      icon: const Icon(Icons.edit),
                      iconSize: 30,
                      color: darkerColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
