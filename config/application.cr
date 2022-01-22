class Application
  Habitat.create do
    setting name : String
    setting support_email : Carbon::Address
  end
end

Application.configure do |settings|
  settings.name = "Bonspiel Studio"
  settings.support_email = Carbon::Address.new(settings.name, "no-reply@bonspiel_studio.com")
end
