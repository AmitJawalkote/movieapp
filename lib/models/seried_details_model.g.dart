// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seried_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesDetailsModel _$SeriesDetailsModelFromJson(Map<String, dynamic> json) =>
    SeriesDetailsModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdropPath'] as String?,
      createdBy: (json['createdBy'] as List<dynamic>?)
          ?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeRunTime: (json['episodeRunTime'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      firstAirDate: json['firstAirDate'] == null
          ? null
          : DateTime.parse(json['firstAirDate'] as String),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt(),
      inProduction: json['inProduction'] as bool?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastAirDate: json['lastAirDate'] == null
          ? null
          : DateTime.parse(json['lastAirDate'] as String),
      lastEpisodeToAir: json['lastEpisodeToAir'] == null
          ? null
          : LastEpisodeToAir.fromJson(
              json['lastEpisodeToAir'] as Map<String, dynamic>),
      name: json['name'] as String?,
      nextEpisodeToAir: json['nextEpisodeToAir'],
      networks: (json['networks'] as List<dynamic>?)
          ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: (json['numberOfEpisodes'] as num?)?.toInt(),
      numberOfSeasons: (json['numberOfSeasons'] as num?)?.toInt(),
      originCountry: (json['originCountry'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['originalLanguage'] as String?,
      originalName: json['originalName'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['posterPath'] as String?,
      productionCompanies: (json['productionCompanies'] as List<dynamic>?)
          ?.map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['productionCountries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      type: json['type'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SeriesDetailsModelToJson(SeriesDetailsModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'createdBy': instance.createdBy,
      'episodeRunTime': instance.episodeRunTime,
      'firstAirDate': instance.firstAirDate?.toIso8601String(),
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'inProduction': instance.inProduction,
      'languages': instance.languages,
      'lastAirDate': instance.lastAirDate?.toIso8601String(),
      'lastEpisodeToAir': instance.lastEpisodeToAir,
      'name': instance.name,
      'nextEpisodeToAir': instance.nextEpisodeToAir,
      'networks': instance.networks,
      'numberOfEpisodes': instance.numberOfEpisodes,
      'numberOfSeasons': instance.numberOfSeasons,
      'originCountry': instance.originCountry,
      'originalLanguage': instance.originalLanguage,
      'originalName': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'seasons': instance.seasons,
      'spokenLanguages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'type': instance.type,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      id: (json['id'] as num?)?.toInt(),
      creditId: json['creditId'] as String?,
      name: json['name'] as String?,
      originalName: json['originalName'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      profilePath: json['profilePath'] as String?,
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'creditId': instance.creditId,
      'name': instance.name,
      'originalName': instance.originalName,
      'gender': instance.gender,
      'profilePath': instance.profilePath,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

LastEpisodeToAir _$LastEpisodeToAirFromJson(Map<String, dynamic> json) =>
    LastEpisodeToAir(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      voteAverage: (json['voteAverage'] as num?)?.toInt(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      airDate: json['airDate'] == null
          ? null
          : DateTime.parse(json['airDate'] as String),
      episodeNumber: (json['episodeNumber'] as num?)?.toInt(),
      episodeType: json['episodeType'] as String?,
      productionCode: json['productionCode'] as String?,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['seasonNumber'] as num?)?.toInt(),
      showId: (json['showId'] as num?)?.toInt(),
      stillPath: json['stillPath'] as String?,
    );

Map<String, dynamic> _$LastEpisodeToAirToJson(LastEpisodeToAir instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'airDate': instance.airDate?.toIso8601String(),
      'episodeNumber': instance.episodeNumber,
      'episodeType': instance.episodeType,
      'productionCode': instance.productionCode,
      'runtime': instance.runtime,
      'seasonNumber': instance.seasonNumber,
      'showId': instance.showId,
      'stillPath': instance.stillPath,
    };

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logoPath'] as String?,
      name: json['name'] as String?,
      originCountry: json['originCountry'] as String?,
    );

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
      'id': instance.id,
      'logoPath': instance.logoPath,
      'name': instance.name,
      'originCountry': instance.originCountry,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    ProductionCountry(
      iso31661: json['iso31661'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'iso31661': instance.iso31661,
      'name': instance.name,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      airDate: json['airDate'] == null
          ? null
          : DateTime.parse(json['airDate'] as String),
      episodeCount: (json['episodeCount'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      seasonNumber: (json['seasonNumber'] as num?)?.toInt(),
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'airDate': instance.airDate?.toIso8601String(),
      'episodeCount': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'seasonNumber': instance.seasonNumber,
      'voteAverage': instance.voteAverage,
    };

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    SpokenLanguage(
      englishName: json['englishName'] as String?,
      iso6391: json['iso6391'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'englishName': instance.englishName,
      'iso6391': instance.iso6391,
      'name': instance.name,
    };
