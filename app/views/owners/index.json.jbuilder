json.array!(@owners) do |owner|
  json.extract! owner, :id, :name, :lastname, :phone
  json.url owner_url(owner, format: :json)
end
