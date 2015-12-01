json.array!(@profiles) do |profile|
  json.extract! profile, :id, :nom, :prenom, :dob, :avatar, :address, :about
  json.url profile_url(profile, format: :json)
end
