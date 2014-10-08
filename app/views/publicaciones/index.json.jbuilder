json.array!(@publicaciones) do |publicacione|
  json.extract! publicacione, :id, :texto, :url, :tipo, :id_autor
  json.url publicacione_url(publicacione, format: :json)
end
