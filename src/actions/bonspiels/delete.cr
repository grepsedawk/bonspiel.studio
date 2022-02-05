class Bonspiels::Delete < BrowserAction
  delete "/bonspiels/:bonspiel_id" do
    bonspiel = BonspielQuery.for(current_user).find(bonspiel_id)
    DeleteBonspiel.delete(bonspiel) do |_operation, _deleted|
      flash.success = "Deleted the bonspiel"
      redirect Dashboard::Index
    end
  end
end
