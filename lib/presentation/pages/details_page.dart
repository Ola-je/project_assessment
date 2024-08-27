import 'package:flutter/material.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';

class DetailsPage extends StatefulWidget {
  final GroceryEntity grocery;
  final int index;

  const DetailsPage({
    Key? key,
    required this.grocery,
    required this.index,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isDescriptionExpanded = false;
  int _quantity = 1;
  List<bool> _selectedOptions = [];

  @override
  void initState() {
    super.initState();
    _selectedOptions = List.filled(widget.grocery.options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300, 
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          widget.grocery.imageUrl,
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black), 
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.favorite_border, color: Colors.red),
                            onPressed: () {
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0), 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.grocery.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${widget.grocery.price.toString()} €',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red, 
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 248, 224, 11),
                            ),
                            const SizedBox(width: 8.0), 
                            Text(
                              '4.9',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8.0), 
                            Text(
                              '(1.205)',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 182, 181, 181),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all reviews',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 50, 50, 50), 
                              decoration: TextDecoration.underline, 
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0), 
                    Text(
                      widget.grocery.description,
                      maxLines: _isDescriptionExpanded ? null : 3,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    if (widget.grocery.description.length > 100)
                      Align(
                        alignment: Alignment.centerRight, 
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _isDescriptionExpanded = !_isDescriptionExpanded;
                            });
                          },
                          child: Text(_isDescriptionExpanded ? 'See less' : 'See more'),
                        ),
                      ),
                    const SizedBox(height: 16.0),
                    if (widget.grocery.options.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Additional Options:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Column(
                            children: widget.grocery.options.asMap().entries.map((entry) {
                              int index = entry.key;
                              var option = entry.value;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      option.name, 
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '+${option.price}', 
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black, 
                                        ),
                                      ),
                                      Checkbox(
                                        value: _selectedOptions[index],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _selectedOptions[index] = value ?? false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                    }
                  },
                ),
                Text('$_quantity', style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            FloatingActionButton.extended(
              onPressed: () {
                // Add to basket functionality
              },
              label: const Text('Add to Basket'),
              icon: const Icon(Icons.shopping_cart),
              backgroundColor: const Color(0xFF3F51F3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
