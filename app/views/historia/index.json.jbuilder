json.array!(@historia) do |historium|
  json.extract! historium, :id, :id_singularidad
  json.url historium_url(historium, format: :json)
end
