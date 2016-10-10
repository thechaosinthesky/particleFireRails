json.extract! io, :id, :name, :io_type, :device_id, :created_at, :updated_at

json.settings JSON.parse(io.settings)