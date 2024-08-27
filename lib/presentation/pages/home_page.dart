import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/presentation/bloc/grocery_bloc.dart';
import 'package:project_assessment/presentation/bloc/grocery_event.dart';
import 'package:project_assessment/presentation/bloc/grocery_state.dart';
import 'package:project_assessment/presentation/pages/basket_page.dart';
import 'package:project_assessment/presentation/widgets/cards.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<GroceryBloc>(context).add(LoadGroceries());
          },
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Cheese Burger.png'),
                  SizedBox(width: screenWidth * 0.01),
                  const Text(
                    'Burger',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 245, 241, 241),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none, 
                  ),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune_outlined),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: BlocBuilder<GroceryBloc, GroceryState>(
                  builder: (context, state) {
                    if (state is GroceryLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is GroceryLoaded) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 10.0, 
                          mainAxisSpacing: 10.0,
                          childAspectRatio: (screenWidth / 2) / (screenHeight / 3),                         ),
                        itemCount: state.groceries.length, 
                        itemBuilder: (context, index) {
                          return Cards(state.groceries[index], index);                         },
                      );
                    } else if (state is GroceryLoadError) {
                      return Center(child: Text(state.message));
                    }
                    return Center(child: Text('No data available'));
                  },
                ),
              ),
              Align(alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BasketPage(),
                  ));
                },
                child: Icon(Icons.shopping_cart),
              ),
              )
             
            ],
          ),
        ),
      ),
    );
  }
}
