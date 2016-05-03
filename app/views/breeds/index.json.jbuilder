json.array!(@breeds) do |breed|
  json.extract! breed, :id, :species, :breed
  json.url breed_url(breed, format: :json)
end
