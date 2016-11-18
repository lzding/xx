json.array!(@components) do |component|
  json.extract! component, :id, :name, :file, :category, :sdk_api_version, :file_hex, :file_directory, :status
  json.url component_url(component, format: :json)
end
