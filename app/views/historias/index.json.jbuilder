json.array!(@historias) do |historias|
  json.extract! historias, :id, :id_singularidad
  json.url historias_url(historias, format: :json)
end
