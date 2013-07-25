json.array!(@notes) do |note|
  json.extract! note, :title, :body, :parent_id, :creator
  json.url note_url(note, format: :json)
end
