import 'package:flutter/material.dart';
import 'package:flutter_application_cat_fact/models/fact.dart';
import 'package:flutter_application_cat_fact/utility/boxse.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class FactHistory extends StatelessWidget {
  final String title;
  const FactHistory({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const _BodyFactHistory(),
    );
  }
}

class _BodyFactHistory extends StatefulWidget {
  const _BodyFactHistory({Key? key}) : super(key: key);

  @override
  State<_BodyFactHistory> createState() => __BodyFactHistory();
}

class __BodyFactHistory extends State<_BodyFactHistory> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Fact>>(
        valueListenable: Boxes.getFacts().listenable(),
        builder: (context, box, _) {
          final List<Fact> facts = box.values.toList();
          return ListView.builder(
              itemCount: facts.length,
              itemBuilder: ((context, index) => _FactItem(
                    text: facts[index].text,
                    date: facts[index].updatedAt,
                  )));
        });
  }
}

class _FactItem extends StatefulWidget {
  final String? text;
  final String? date;
  const _FactItem({Key? key, required this.text, required this.date})
      : super(key: key);
  @override
  State<_FactItem> createState() => _FactItemState();
}

class _FactItemState extends State<_FactItem> {
  DateFormat formattedDate = DateFormat('dd-MM-yy – kk:mm');
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.text ?? ""),
              const SizedBox(
                height: 10,
              ),
              Text(formattedDate.format(
                  DateTime.parse(widget.date ?? DateTime.now().toString())))
            ],
          ),
        ));
  }
}
