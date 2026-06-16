import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/theme/app_colors.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final List<Map<String, dynamic>> _shoppingItems = [
    {'name': 'Milk', 'category': 'Dairy', 'quantity': 2, 'unit': 'L', 'bought': false},
    {'name': 'Bread', 'category': 'Bakery', 'quantity': 1, 'unit': 'pcs', 'bought': false},
    {'name': 'Apples', 'category': 'Fruits', 'quantity': 1, 'unit': 'kg', 'bought': true},
    {'name': 'Carrots', 'category': 'Vegetables', 'quantity': 500, 'unit': 'g', 'bought': false},
  ];

  final List<String> _categories = [
    'All',
    'Vegetables',
    'Fruits',
    'Dairy',
    'Bakery',
    'Meat',
    'Other'
  ];

  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Category Filter
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _selectedCategory = category);
                    },
                    selectedColor: AppColors.primaryLight,
                    labelStyle: GoogleFonts.poppins(
                      color: isSelected ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Shopping Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _shoppingItems.length,
              itemBuilder: (context, index) {
                final item = _shoppingItems[index];
                return _ShoppingItemTile(
                  item: item,
                  onToggle: () {
                    setState(() {
                      item['bought'] = !item['bought'];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _AddItemDialog(
        categories: _categories,
        onItemAdded: () {
          Navigator.pop(context);
          setState(() {});
        },
      ),
    );
  }
}

class _ShoppingItemTile extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onToggle;

  const _ShoppingItemTile({
    required this.item,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Checkbox(
          value: item['bought'],
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          item['name'],
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            decoration: item['bought']
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                item['category'],
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${item['quantity']} ${item['unit']}',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {},
        ),
      ),
    );
  }
}

class _AddItemDialog extends StatefulWidget {
  final List<String> categories;
  final VoidCallback onItemAdded;

  const _AddItemDialog({
    required this.categories,
    required this.onItemAdded,
  });

  @override
  State<_AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<_AddItemDialog> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  late String _selectedCategory;
  String _selectedUnit = 'pcs';

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Shopping Item'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: widget.categories
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedCategory = val ?? ''),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedUnit,
                  items: ['pcs', 'kg', 'g', 'L', 'ml']
                      .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedUnit = val ?? 'pcs'),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => widget.onItemAdded(),
          child: const Text('Add Item'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
