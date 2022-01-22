class Bonspiels::Show < BrowserAction
  get "/bonspiels/:bonspiel_id" do
    html ShowPage, bonspiel: BonspielQuery.find(bonspiel_id)
  end
end
