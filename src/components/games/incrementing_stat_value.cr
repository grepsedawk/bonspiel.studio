class Games::IncrementingStatValue(T) < BaseComponent
  needs attribute : Avram::PermittedAttribute(T)
  needs game : Game

  def render
    div class: "stat-value" do
      form_for Games::Update.with(game.id), class: "inline" do
        hidden_input attribute, value: Math.max(value - 1, 0)
        submit "-", class: "btn btn-circle"
      end
      text value
      form_for Games::Update.with(game.id), class: "inline" do
        hidden_input attribute, value: value + 1
        submit "+", class: "btn btn-circle"
      end
    end
  end

  private def value
    attribute.value || 0
  end
end
