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

void main() {
  // Initialises the code generation for [get_it].

  // Unit Tests

  // blocs

  // settings bloc
  settings_bloc.main();
  settings_event.main();
  settings_state.main();

  // theme bloc
  theme_bloc.main();
  theme_state.main();
  theme_event.main();

  // weather bloc
  weather_bloc.main();
  weather_event.main();
  weather_state.main();

  // entities

  // settings entity
  settings_entity.main();
  // theme entity
  theme_entity.main();
  // weather entity
  weather_entity.main();

  // Widget tests

  // pages

  // Location Search Page
  // Settings page
  // Weather Page

  // widgets
  // City Selection
  // Combined Weather Temperature
  // Flutter Bloc
  // Gradient Container
  // Last Updated
  // Location
  // Settings
  // Temperature
  // Weather
  // Weather Conditions
}
