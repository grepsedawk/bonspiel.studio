class Draws::UpdatePage < ScoreboardLayout
  needs draw : Draw

  def content
    mount Draws::Switcher, draw: draw
  end
end
