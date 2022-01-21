class Bonspiels::New < BrowserAction
  get "/bonspiels/new" do
    html NewPage, operation: SaveBonspiel.new
  end
end
