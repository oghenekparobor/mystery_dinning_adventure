

import 'package:flutter/material.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';

class LeaveAReview extends StatefulWidget {
  const LeaveAReview({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<LeaveAReview> createState() => _LeaveAReviewState();
}

class _LeaveAReviewState extends State<LeaveAReview> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0; // Initial rating

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _reviewController,
            decoration: const InputDecoration(labelText: 'Write your review'),
            maxLines: 3,
            onChanged: (_) =>
                setState(() {}), // To update the UI when text changes
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<double>(
            value: _rating,
            onChanged: (value) => setState(() => _rating = value!),
            items: List.generate(6, (index) {
              return DropdownMenuItem<double>(
                value: index.toDouble(),
                child: Text('$index'),
              );
            }),
            decoration: const InputDecoration(labelText: 'Select your rating'),
            validator: (value) {
              if (value == 0) {
                return 'Please select a rating';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _reviewController.text.isEmpty || _rating == 0
                ? null
                : _submitReview,
            child: const Text('Leave a review'),
          ),
        ],
      ),
    );
  }

  void _submitReview() {
    // Submit the review and rating
    final review = _reviewController.text;

    context.myn.leaveReview(widget.id, review, _rating).then((value) {
      // Clear the text field and reset the rating
      _reviewController.clear();
      setState(() {
        _rating = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
