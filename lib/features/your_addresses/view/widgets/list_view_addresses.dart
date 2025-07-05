import 'package:flutter/cupertino.dart';  
import 'package:foodix/features/your_addresses/view/widgets/custom_item_list_view_addresses.dart';  

class ListViewAddresses extends StatelessWidget {
  const ListViewAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return const CustomItemListViewAddresses();
        },
      ),
    );
  }
}
