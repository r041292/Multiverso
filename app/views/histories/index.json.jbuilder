json.array!(@histories) do |history|
  json.extract! history, :id, :publication_id
  json.url history_url(history, format: :json)
end
