import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_review.dart';
import 'package:moomalpublication/features/product_detail/data/models/review_post_response/review_post_response_data.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef ProductDetailResponse = ApiResponse<ProductItem>;
typedef SimilarProductResponse = ApiResponse<List<ProductItem>>;
typedef ProductReviewsResponse = ApiResponse<List<ProductReview>>;
typedef ReviewPostResponse = ApiResponse<ReviewPostResponseData>;
