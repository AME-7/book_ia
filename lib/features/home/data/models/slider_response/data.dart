import 'slider.dart';

class SliderResponse {
  List<Slider>? sliders;

  SliderResponse({this.sliders});

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
    sliders: (json['sliders'] as List<dynamic>?)
        ?.map((e) => Slider.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'sliders': sliders?.map((e) => e.toJson()).toList(),
  };
}
