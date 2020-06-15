import './blocs/settings/settings_bloc_test.dart' as settings_bloc;
import './blocs/settings/settings_event_test.dart' as settings_event;
import './blocs/settings/settings_state_test.dart' as settings_state;
import './blocs/weather/weather_bloc_test.dart' as weather_bloc;
import './blocs/weather/weather_event_test.dart' as weather_event;
import './blocs/weather/weather_state_test.dart' as weather_state;
import './blocs/theme/theme_bloc_test.dart' as theme_bloc;
import './blocs/theme/theme_state_test.dart' as theme_state;
import './blocs/theme/theme_event_test.dart' as theme_event;

void main() {
  // Initialises the code generation for [get_it].

  // blocs

  // weather bloc
  weather_bloc.main();
  weather_event.main();
  weather_state.main();

  // settings bloc
  settings_bloc.main();
  settings_event.main();
  settings_state.main();

  // theme bloc
  theme_bloc.main();
  theme_state.main();
  theme_event.main();
  // pages

  // widgets
}
