import 'package:edutime/provider/venue_booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VenueBookingProvider>().getExistingBuildings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<VenueBookingProvider>();
    final buildings = provider.existingBuildings;

    if (provider.venueStatus == VenueStatus.fetching) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (provider.venueStatus == VenueStatus.failed) {
      return Scaffold(body: Center(
          child: Text(provider.errorMessage ?? "Error fetching buildings")));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView.builder(
          itemCount: buildings.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(buildings[index].initials),
            );
          },
        ),
      ),
    );
  }
}
