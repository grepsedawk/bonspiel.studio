class Games::AutoSavingInput(T) < BaseComponent
  needs attribute : Avram::PermittedAttribute(T)
  needs game : Game
  needs append_class : String?
  needs placeholder : String?

  def render
    form_for Games::Update.with(game.id), data_controller: "autoSaveInput", class: "#{append_class}" do
      text_input attribute, data_action: "change->autoSaveInput#submit", class: "text-center inline input input-ghost", placeholder: placeholder.to_s
    end
  end
end
