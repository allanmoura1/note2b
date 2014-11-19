json.array!(@bills) do |bill|
  json.extract! bill, :id, :numero_documento, :id_upload, :notes
  json.url bill_url(bill, format: :json)
end
