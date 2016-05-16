json.set! :categories do
  json.array!(@categories) do |category|
    json.title category.name.titleize
    json.slug category.name
  end
end

json.set! :meta do
  json.code response.status
end
