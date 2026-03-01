
/// @description Initialize the Aptabase client with your app key and optional configuration.
function aptabase_init(appKey, config = undefined) {
    if(is_undefined(appKey) || !is_string(appKey) || string_length(string_trim(appKey)) <= 0) {
        show_debug_message("Aptabase Error: Invalid App Key provided to aptabase_init. Please ensure you use a valid App Key from your Aptabase project.");
        return;
    }

    global.__aptabaseClient.appKey = appKey;
    global.__aptabaseClient.apply_config(config);

    if(!instance_exists(__obj_Aptabase_daemon)) {
        instance_create_depth(0, 0, 10000, __obj_Aptabase_daemon);
    }

    global.__aptabaseClient.start();

    show_debug_message($"Welcome to use gm-aptabase@{__APTABASE_SDK_VERSION}! Aptabase initialized.");
}

/// @description Track an event with optional properties.
function aptabase_track(eventName, props = undefined) {
    var event = new __AptabaseEvent(eventName, props);
    global.__aptabaseClient.push_event(event);
}

/// @description Manually flush events to the server. 
function aptabase_flush() {
    global.__aptabaseClient.flush();
}
