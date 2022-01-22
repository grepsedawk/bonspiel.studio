class Bonspiels::Draws::Create < BrowserAction
  post "/bonspiels/:bonspiel_id/draws" do
    bonspiel = BonspielQuery.for(current_user).find(bonspiel_id)

    SaveDraw.create(params, bonspiel_id: bonspiel.id) do |operation, draw|
      if draw
        flash.success = "Draw has been added!"
        redirect Bonspiels::Show.with(bonspiel.id)
      else
        flash.failure = "It looks like the form is not valid"
        html Bonspiels::ShowPage, operation: operation, bonspiel: bonspiel
      end
    end
  end
end
