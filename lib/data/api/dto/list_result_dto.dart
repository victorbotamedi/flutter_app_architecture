typedef ItemDeserializer<T> = T Function(Map<String, dynamic> json);

class ListResultDto<T> {
  final int count;
  final List<T> results;

  const ListResultDto({
    required this.count,
    required this.results,
  });

  factory ListResultDto.fromJson(
    Map<String, dynamic> json,
    ItemDeserializer<T> itemDeserializer,
  ) {
    return ListResultDto(
      count: json["count"],
      results: List.from(json["results"].map((map) => itemDeserializer(map))),
    );
  }
}
