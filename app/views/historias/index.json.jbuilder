json.array!(@historias) do |historia|
  json.extract! historia, :id, :id_singularidad
  json.url historia_url(historia, format: :json)
end
