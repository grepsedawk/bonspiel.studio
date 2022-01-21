class Bonspiels::Update < BrowserAction
  put "/bonspiels/:bonspiel_id" do
    bonspiel = BonspielQuery.for(current_user).find(bonspiel_id)
    SaveBonspiel.update(bonspiel, params) do |operation, updated_bonspiel|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_bonspiel.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, bonspiel: updated_bonspiel
      end
    end
  end
end
