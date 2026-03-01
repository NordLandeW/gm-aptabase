# gm-aptabase

A lightweight Aptabase SDK for GameMaker (2024.2+).

[![Aptabase](https://img.shields.io/badge/Aptabase-Analytics-blue)](https://github.com/aptabase/aptabase)
[![GameMaker](https://img.shields.io/badge/GameMaker-2024.2+-green)](https://gamemaker.io)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

## Quick Start

1. **Initialization**
   
   Initialize the SDK when the game starts.
   ```gml
   aptabase_init("A-US-1234567890"); // Replace with your App Key
   ```
   
   You can optionally pass a configuration struct to override the default settings from `Aptabase_config.gml` at runtime:
   ```gml
   aptabase_init("A-US-1234567890", {
       app_version: "1.2.0",      // Override game version
       flush_interval: 15,        // Auto flush interval in seconds
       max_batch_size: 10,        // Max events per request
       is_debug: true,            // Enable debug logging
       base_url: "https://..."    // Optional: for self-hosted tracking
   });
   ```

2. **Track Events**
   ```gml
   aptabase_track("game_start");
   
   // Track with properties
   aptabase_track("level_complete", {
       level_id: "forest_01",
       score: 5000,
       is_hard_mode: true
   });
   ```

3. **Manual Flush (Optional)**
   
   The SDK flushes events every 10 seconds by default, but you can force it:
   ```gml
   aptabase_flush();
   ```

## Configuration

You can customize the SDK behavior by modifying the macros in `Aptabase_config.gml`:

| Macro                     | Default      | Description                                                                                          |
| :------------------------ | :----------- | :--------------------------------------------------------------------------------------------------- |
| `APTABASE_APP_VERSION`    | `"1.0.0"`    | Your game's version string.                                                                          |
| `APTABASE_SH_HOST`        | `""`         | Set this to your custom host URL if using a Self-Hosted (`A-SH-*`) App Key.                          |
| `APTABASE_BASE_URL`       | `""`         | Overrides the API endpoint entirely. Leave empty to let the SDK auto-detect based on App Key.        |
| `APTABASE_FLUSH_INTERVAL` | `10`         | Automatic flush interval in seconds.                                                                 |
| `APTABASE_MAX_BATCH_SIZE` | `25`         | Max events per request (Aptabase limit is 25).                                                       |
| `APTABASE_RANDOMIZE`      | `true`       | **Warning**: If true, calls `randomize()` for Session IDs. This mutates GameMaker's global RNG seed. |
| `APTABASE_IS_DEBUG`       | `debug_mode` | Enables detailed logging in the Output window.                                                       |

> **Note:** Any properties passed in the `config` struct during `aptabase_init(appKey, config)` will override these macro defaults at runtime.