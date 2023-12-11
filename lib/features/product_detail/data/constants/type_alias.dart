import 'package:moomalpublication/features/product_detail/data/models/product_detail/product_detail_data.dart';
import 'package:moomalpublication/features/product_detail/data/models/product_review.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

typedef ProductDetailResponse = ApiResponse<ProductDetailData>;
typedef SimilarProductResponse = ApiResponse<List<ProductDetailData>>;
typedef ProductReviewsResponse = ApiResponse<List<ProductReview>>;
