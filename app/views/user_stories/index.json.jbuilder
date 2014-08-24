json.array!(@user_stories) do |user_story|
  json.extract! user_story, :id, :name, :descp, :state
  json.url user_story_url(user_story, format: :json)
end
