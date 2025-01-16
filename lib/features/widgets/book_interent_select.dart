import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';

class BookInterentSelect extends StatefulWidget {
  final Function(List<String>) onInterestsChanged;

  const BookInterentSelect({super.key, required this.onInterestsChanged});

  @override
  State<BookInterentSelect> createState() => _BookInterentSelectState();
}

class _BookInterentSelectState extends State<BookInterentSelect> {
  List<String> _selectedInterests = [];

  final List<String> _bookTypes = [
    'Fiction',
    'Non-fiction',
    'Science',
    'History',
    'Biography',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _bookTypes.map((bookType){
        return CheckboxListTile(
          activeColor: AppColors.primary,
          title: Text(bookType),
          value: _selectedInterests.contains(bookType),
          onChanged: (isSelected){
            setState(() {
              isSelected!
                ? _selectedInterests.add(bookType)
                : _selectedInterests.remove(bookType);
            });
            widget.onInterestsChanged(_selectedInterests);
          },
        );
      }).toList(),
    );
  }
}