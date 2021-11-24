import 'package:flutter/material.dart';
import 'package:unipam_mobile/shared/util/modules_list.dart';
import 'package:unipam_mobile/shared/widgets/module_page/module_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return ModulePage(
      title: 'Eventos',
      pages: ModulesListEvents().eventsModules,
    );
  }
}
