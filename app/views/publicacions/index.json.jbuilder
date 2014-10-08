json.array!(@publicacions) do |publicacion|
  json.extract! publicacion, :id, :contenido, :url, :tipo, :id_autor
  json.url publicacion_url(publicacion, format: :json)
end
