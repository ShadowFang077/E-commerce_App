import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartWidget extends StatelessWidget {
  final List<String> itemImage;
  final String itemName;
  final String itemPrice;
  final VoidCallback onRemove;
  const CartWidget(
      {super.key,
      required this.itemName,
      required this.itemImage,
      required this.onRemove,
      required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(itemImage.isNotEmpty ? itemImage[0] : ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: $itemPrice',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: 'M',
                        items: ['S', 'M', 'L', 'XL'].map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                      ),
                      SizedBox(width: 16),
                      DropdownButton<int>(
                        value: 1,
                        items: [1, 2, 3].map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
              IconButton(onPressed: onRemove, icon: Icon(Icons.delete,color: Colors.grey,)),
          SizedBox(height: 16),
          Divider(thickness: 1, color: Colors.grey[300]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                itemPrice,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
  ],
      ),
    );
  }
}
