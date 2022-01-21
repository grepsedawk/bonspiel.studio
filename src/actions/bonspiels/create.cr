class Bonspiels::Create < BrowserAction
  post "/bonspiels" do
    SaveBonspiel.create(params, owner_id: current_user.id) do |operation, bonspiel|
      if bonspiel
        flash.success = "The record has been saved"
        redirect Show.with(bonspiel.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
