json.array!(@definitions) do |definition|
  json.extract! definition, :id, :word, :meaning
  json.url definition_url(definition, format: :json)
end
