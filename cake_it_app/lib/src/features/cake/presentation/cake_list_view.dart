import 'package:cake_it_app/src/features/cake/domain/cake.dart';
import 'package:cake_it_app/src/features/cake/presentation/cake_details_view.dart';
import 'package:cake_it_app/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

import '../../../api/cake_api.dart';
import '../data/cake_repository.dart';

/// Displays a list of cakes.
class CakeListView extends StatelessWidget {
  CakeListView({super.key}) : cakesNotifier = ValueNotifier<List<Cake>>([]) {
    // Fetch the cakes when the widget is created.
    _fetchCakes();
  }

  static const routeName = '/';
  final ValueNotifier<List<Cake>> cakesNotifier;
  final CakeRepository _repository = CakeRepository(api: CakeApi());

  Future<void> _fetchCakes() async {
    try {
      final cakes = await _repository.fetchCakes();
      cakesNotifier.value = cakes;
    } catch (e) {
      cakesNotifier.value = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎂CakeItApp🍰'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Cake>>(
        valueListenable: cakesNotifier,
        builder: (context, cakes, _) {
          if (cakes.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            restorationId: 'cakeListView',
            itemCount: cakes.length,
            itemBuilder: (BuildContext context, int index) {
              final cake = cakes[index];
              return ListTile(
                title: Text(cake.title ?? ''),
                subtitle: Text(cake.description ?? ''),
                leading: CircleAvatar(
                  foregroundImage: NetworkImage(cake.image ?? ''),
                  backgroundImage: const AssetImage('assets/images/flutter_logo.png'),
                ),
                onTap: () {
                  Navigator.restorablePushNamed(
                    context,
                    CakeDetailsView.routeName,
                    arguments: cake.toJson(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
