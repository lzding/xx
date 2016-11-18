json.array!(@companies) do |company|
  json.extract! company, :id, :title, :picture
  json.url company_url(company, format: :json)
end
