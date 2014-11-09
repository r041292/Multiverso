json.array!(@publications) do |publication|
  json.extract! publication, :id, :content, :url, :user_id, :type, :singularity
  json.url publication_url(publication, format: :json)
end
