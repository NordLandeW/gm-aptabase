aptabase_init("A-US-1234567890");

aptabase_track("app_start");

call_later(4, time_source_units_frames, function() {aptabase_flush();}, false);