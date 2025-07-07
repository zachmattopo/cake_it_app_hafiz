import 'package:cake_it_app/src/features/cake/domain/cake.dart';
import 'package:flutter/material.dart';

/// Displays detailed information about a cake.
class CakeDetailsView extends StatelessWidget {
  const CakeDetailsView({
    super.key,
  });

  static const routeName = '/cake_detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Cake cake = Cake.fromJson(args);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake Details'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.network(
                  cake.image ?? '',
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null ? child : const CircularProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/flutter_logo.png'),
                ),
                Text(
                  '${cake.title}',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${cake.description}',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
