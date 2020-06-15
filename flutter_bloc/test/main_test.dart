import './blocs/settings/settings_bloc_test.dart' as settings_bloc;
import './blocs/settings/settings_event_test.dart' as settings_event;
import './blocs/settings/settings_state_test.dart' as settings_state;
import './blocs/weather/weather_bloc_test.dart' as weather_bloc;
import './blocs/weather/weather_event_test.dart' as weather_event;
import './blocs/weather/weather_state_test.dart' as weather_state;

void main() {
  // Initialises the code generation for [get_it].

  // bloc
  weather_bloc.main();
  weather_event.main();
  weather_state.main();

  settings_bloc.main();
  settings_event.main();
  settings_state.main();

  // pages

  // widgets
}
