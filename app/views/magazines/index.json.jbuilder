json.array!(@magazines) do |magazine|
  json.extract! magazine, :id, :name, :decription, :image
  json.url magazine_url(magazine, format: :json)
end
