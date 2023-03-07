defmodule Spotify do
  use HTTPoison.Base

  @spotify_url "https://api.spotify.com/v1"

  def process_request_headers(headers, _opts) do
    headers ++ [
      {"Authorization", "Bearer #{get_access_token()}"}
    ]
  end

  defp get_access_token() do
    # implement OAuth 2.0 authentication and return access token
  end

  def create_playlist(user_id, name, description \\ "") do
    url = "#{@spotify_url}/users/#{user_id}/playlists"
    body = %{name: name, description: description}
    headers = [{"Content-Type", "application/json"}]
    HTTPoison.post(url, Jason.encode!(body), headers)
  end

  def add_tracks_to_playlist(playlist_id, track_uris) do
    url = "#{@spotify_url}/playlists/#{playlist_id}/tracks"
    body = %{uris: track_uris}
    headers = [{"Content-Type", "application/json"}]
    HTTPoison.post(url, Jason.encode!(body), headers)
  end

  def add_playlist_cover_image(playlist_id, image_path) do
    url = "#{@spotify_url}/playlists/#{playlist_id}/images"
    body = Base.encode64(File.read!(image_path))
    headers = [{"Content-Type", "image/jpeg"}]
    HTTPoison.put(url, body, headers)
  end
end
