# Radio Station Fetcher

This Bash script fetches radio stations based on specified music genres (tags) and categorizes them into M3U playlists. It utilizes the Radio-Browser.info API to search for stations and then tests each station's availability before adding it to the corresponding playlist.

## Features

* **Categorized Playlists:** Organizes stations into separate M3U playlists based on predefined music categories.
* **Tag-Based Search:** Uses tags (genres) to query the Radio-Browser.info API for relevant stations.
* **Availability Check:** Tests each station's stream URL to ensure it's accessible before adding it to the playlist.
* **Error Handling:** Skips stations that are already in the playlist or have unreachable streams.
* **Progress Updates:** Prints the number of stations found for each category and the overall progress.

## Usage

1. **Prerequisites:**
   * Bash
   * `curl`

2. **Configuration:**
   * Modify the `categories` array in the script to define your desired music categories and their associated tags. You can have any LLM (ChatGPT, Gemini, i.e. "AI") help you make your own categories. see `prompts.txt` for example prompts. 
   * Optionally, adjust the `base_url` if you want to use a different Radio-Browser.info API server.
   * Set `debug=1` if you want to see detailed debugging output.

3. **Execution:**
   * Save the script as a `.sh` file (e.g., `downloader.bash`).
   * Make it executable: `chmod +x downloader.bash`
   * Run the script: `./downloader.bash`



## Output

The script generates M3U playlist files (e.g., `stations.Chill_Positive.m3u`) in the current directory. Each playlist contains a list of working radio station stream URLs for the corresponding music category.

## Important Notes

* The script currently uses a fixed API server URL. You might want to implement server rotation or randomization to distribute the load and avoid potential rate limits if you have superfast internet.
* The availability check is based on a simple HTTP status code check and timeout benchmark.

