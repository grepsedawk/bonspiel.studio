class Bonspiels::Title::Index < BrowserAction
  include Auth::AllowGuests

  get "/bonspiels/:bonspiel_id/title" do
    bonspiel = BonspielQuery.find(bonspiel_id)

    return html IndexPage, bonspiel_name: bonspiel.name
    head 200
  end
end
