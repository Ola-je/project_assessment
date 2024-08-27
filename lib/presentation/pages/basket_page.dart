import 'package:flutter/material.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/presentation/widgets/bascket_manager.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final basketItems = BasketManager().items;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Basket'),
      ),
      body: basketItems.isEmpty
          ? Center(child: Text('Your basket is empty'))
          : ListView.builder(
              itemCount: basketItems.length,
              itemBuilder: (context, index) {
                final item = basketItems[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text('${item.discount} €'),
                  leading: Image.network(
                    item.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}
