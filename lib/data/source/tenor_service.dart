import 'package:dio/dio.dart';
import 'package:flutter_gif_search/data/source/tenor_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'tenor_service.g.dart';

/// Tenor API Service for getting "trending" and "search" API results.
///
/// Custom API interfaces for the Tenor API.
@RestApi(baseUrl: 'https://g.tenor.com')
abstract class TenorService {
  factory TenorService(Dio dio, {String baseUrl}) = _TenorService;

  static const defaultLimitCount =
      15 * 3; // 3 for gridlayout, 15 per page, 50 max
  static const apiKey = 'LIVDSRZULELA';
  static const mediaFilter = 'minimal';

  /// Get search gif results by a search string.
  ///
  /// URL: https://g.tenor.com/
  /// Path: /v1/search
  /// Query: key REQUIRED, client key for privileged API access
  /// Query: media_filter STRONGLY RECOMMENDED, minimal - tinygif, gif, and mp4.
  /// Query: q REQUIRED, a search string
  /// Query: limit OPTIONAL, fetch up to a specified number of results (max: 50).
  /// Query: pos OPTIONAL, get results starting at position "value".
  /// eg. https://g.tenor.com/v1/search?key=LIVDSRZULELA&media_filter=minimal&q=hello&limit=45
  ///
  /// @param query Search string to find gifs.
  /// @param position Position of results.
  /// @return Response of search results.
  @GET(
      '/v1/search?key=$apiKey&media_filter=$mediaFilter&limit=$defaultLimitCount')
  Future<HttpResponse<TenorResponseDto>> getSearchResults(
    @Query('q') String query,
    @Query('pos') String? position,
  );

  /// Get trending gif results.
  ///
  /// URL: https://g.tenor.com/
  /// Path: /v1/trending
  /// Query: key REQUIRED, client key for privileged API access
  /// Query: media_filter STRONGLY RECOMMENDED, minimal - tinygif, gif, and mp4.
  /// Query: limit OPTIONAL, fetch up to a specified number of results (max: 50).
  /// Query: pos OPTIONAL, get results starting at position "value".
  /// eg. https://g.tenor.com/v1/trending?key=LIVDSRZULELA&media_filter=minimal&limit=45
  ///
  /// @param position Position of results.
  /// @return Response of trending results.
  @GET(
      '/v1/trending?key=$apiKey&media_filter=$mediaFilter&limit=$defaultLimitCount')
  Future<HttpResponse<TenorResponseDto>> getTrendingResults(
    @Query('pos') String? position,
  );
}
