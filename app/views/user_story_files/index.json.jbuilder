json.array!(@user_story_files) do |user_story_file|
  json.extract! user_story_file, :id
  json.url user_story_file_url(user_story_file, format: :json)
end
