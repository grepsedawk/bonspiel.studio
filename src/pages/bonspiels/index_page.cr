class Bonspiels::IndexPage < MainLayout
  needs bonspiels : BonspielQuery
  quick_def page_title, "All Bonspiels"

  def content
    h1 "All Bonspiels"
    link "New Bonspiel", to: Bonspiels::New
    render_bonspiels
  end

  def render_bonspiels
    ul do
      bonspiels.each do |bonspiel|
        li do
          link bonspiel.name, Bonspiels::Show.with(bonspiel)
        end
      end
    end
  end
end
