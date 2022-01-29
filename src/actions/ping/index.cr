class Ping::Index < BrowserAction
  include Auth::AllowGuests

  get "/ping" do
    return head 418 if Avram::Migrator::Runner.migrations.any?(&.new.pending?)

    head 200
  end
end
