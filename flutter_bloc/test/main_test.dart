import './ui/pages/location_search_page_test.dart' as location_search_page;
import './ui/pages/settings_page_test.dart' as settings_page;
import './ui/pages/weather_page_test.dart' as weather_page;
import './unit/blocs/settings/settings_bloc_test.dart' as settings_bloc;
import './unit/blocs/settings/settings_event_test.dart' as settings_event;
import './unit/blocs/settings/settings_state_test.dart' as settings_state;
import './unit/blocs/theme/theme_bloc_test.dart' as theme_bloc;
import './unit/blocs/theme/theme_event_test.dart' as theme_event;
import './unit/blocs/theme/theme_state_test.dart' as theme_state;
import './unit/blocs/weather/weather_bloc_test.dart' as weather_bloc;
import './unit/blocs/weather/weather_event_test.dart' as weather_event;
import './unit/blocs/weather/weather_state_test.dart' as weather_state;
import './unit/entities/settings_entity_test.dart' as settings_entity;
import './unit/entities/theme_entity_test.dart' as theme_entity;
import './unit/entities/weather_entity_test.dart' as weather_entity;
import 'ui/widgets/city_selection_test.dart' as city_selection;
import 'ui/widgets/combined_weather_temperature_test.dart'
    as combined_weather_temperature;
import 'ui/widgets/flutter_bloc_app_test.dart' as flutter_bloc_app;
import 'ui/widgets/gradient_container_test.dart' as gradient_container;
import 'ui/widgets/last_updated_test.dart' as last_updated;
import 'ui/widgets/location_test.dart' as location;
import 'ui/widgets/settings_test.dart' as settings;
import 'ui/widgets/temperature_test.dart' as temperature;
import 'ui/widgets/weather_conditions_test.dart' as weather_conditions;
import 'ui/widgets/weather_test.dart' as weather;

void main() {
  // Initialises the code generation for [get_it].
// test
  // Unit tests

  // Blocs

  // Settings bloc
  settings_bloc.main();
  settings_event.main();
  settings_state.main();

  // theme bloc
  theme_bloc.main();
  theme_state.main();
  theme_event.main();

  // Weather bloc
  weather_bloc.main();
  weather_event.main();
  weather_state.main();

  // Entities

  // Settings entity
  settings_entity.main();
  // Theme entity
  theme_entity.main();
  // Weather entity
  weather_entity.main();

  // Widget tests

  // Pages

  // Location Search Page
  location_search_page.main();
  // Settings page
  settings_page.main();
  // Weather Page
  weather_page.main();

  // Widgets

  // City Selection
  city_selection.main();
  // Combined Weather Temperature
  combined_weather_temperature.main();
  // Flutter Bloc
  flutter_bloc_app.main();
  // Gradient Container
  gradient_container.main();
  // Last Updated
  last_updated.main();
  // Location
  location.main();
  // Settings
  settings.main();
  // Temperature
  temperature.main();
  // Weather
  weather.main();
  // Weather Conditions
  weather_conditions.main();
}
