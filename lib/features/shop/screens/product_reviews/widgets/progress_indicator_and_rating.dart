import 'package:flutter/material.dart';
import 'package:t_store/features/shop/controllers/review_controller.dart';
import 'package:t_store/features/shop/models/review_model.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/progress_indicator.dart';

class OverallProductRating extends StatelessWidget {
  final List<ReviewModel> list;
  
  const OverallProductRating({
    super.key,
    required this.list,
  });

  Map<String, double> calculateRatingDistribution() {
    // Count the number of reviews for each rating
    Map<int, int> ratingCounts = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};
    
    for (var review in list) {
      int rating = review.rating.round();
      ratingCounts[rating] = (ratingCounts[rating] ?? 0) + 1;
    }
    
    // Calculate the proportion for each rating
    Map<String, double> ratingDistribution = {};
    int totalReviews = list.length;
    
    if (totalReviews > 0) {
      for (var rating in ratingCounts.keys) {
        double proportion = ratingCounts[rating]! / totalReviews;
        ratingDistribution[rating.toString()] = proportion;
      }
    }
    
    return ratingDistribution;
  }

  @override
  Widget build(BuildContext context) {
    final controller = ReviewController.instance;
    final ratingDistribution = calculateRatingDistribution();
    
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            controller.avgRating.value.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                text: '5',
                value: ratingDistribution['5'] ?? 0.0,
              ),
              TRatingProgressIndicator(
                text: '4',
                value: ratingDistribution['4'] ?? 0.0,
              ),
              TRatingProgressIndicator(
                text: '3',
                value: ratingDistribution['3'] ?? 0.0,
              ),
              TRatingProgressIndicator(
                text: '2',
                value: ratingDistribution['2'] ?? 0.0,
              ),
              TRatingProgressIndicator(
                text: '1',
                value: ratingDistribution['1'] ?? 0.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}