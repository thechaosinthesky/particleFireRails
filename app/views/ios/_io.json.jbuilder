json.extract! io, :id, :name, :io_type, :created_at, :updated_at

json.settings JSON.parse(io.settings)