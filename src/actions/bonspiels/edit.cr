class Bonspiels::Edit < BrowserAction
  get "/bonspiels/:bonspiel_id/edit" do
    bonspiel = BonspielQuery.for(current_user).find(bonspiel_id)
    html EditPage,
      operation: SaveBonspiel.new(bonspiel),
      bonspiel: bonspiel
  end
end
