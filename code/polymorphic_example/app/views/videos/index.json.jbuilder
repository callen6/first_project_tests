json.array!(@videos) do |video|
  json.extract! video, :link, :name
  json.url video_url(video, format: :json)
end
