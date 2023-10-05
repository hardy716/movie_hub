// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MovieApiService implements MovieApiService {
  _MovieApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://movies-api.nomadcoders.workers.dev';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<MovieModel>> getMovies(MovieType movieType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;

    try {
      final _response = await _dio.fetch<Map<String, dynamic>>(
          _setStreamType<Map<String, dynamic>>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                '/${movieType.urlPath}',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      final data = handleResponse(_response);
      final List<dynamic> movies = data['results'];
      var movieInstances = movies
          .map((dynamic i) => MovieModel.fromJson(i as Map<String, dynamic>))
          .toList();

      return movieInstances;
    } catch (e) {
      debugPrint('Error occurred: $e');
      rethrow;
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(String movieID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': movieID};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    try {
      final _response = await _dio
          .fetch<Map<String, dynamic>>(_setStreamType<MovieDetailModel>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
              .compose(
                _dio.options,
                '/movie',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                  baseUrl: _combineBaseUrls(
                _dio.options.baseUrl,
                baseUrl,
              ))));
      final movieDetailInstance = MovieDetailModel.fromJson(_response.data!);
      return movieDetailInstance;
    } catch (e) {
      debugPrint('Error occurred: $e');
      rethrow;
    }
  }

  Map<String, dynamic> handleResponse(Response<Map<String, dynamic>> response) {
    if (response.statusCode != 200) {
      throw Exception(
          'Failed to load data with status code: ${response.statusCode}');
    }
    if (!response.data!.containsKey('results') ||
        response.data!['results'] is! List) {
      throw Exception('Invalid data format');
    }
    return response.data!;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
