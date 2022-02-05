class Dashboard::IndexPage < MainLayout
  needs bonspiels : BonspielQuery

  def page_title
    "Dashboard"
  end

  def content
    div class: "overflow-hidden rounded-lg" do
      div class: "px-4 py-5 sm:px-6" do
        h1 "Your Dashboard", class: "font-medium text-lg"
      end

      div class: "card shadow" do
        div class: "card-body" do
          h2 "Upcoming and Ongoing", class: "card-title"
          ul do
            bonspiels.each do |bonspiel|
              li do
                link bonspiel.to_s, Bonspiels::Show.with(bonspiel), class: "link"
              end
            end
            div class: "card-actions" do
              link "New Bonspiel", to: Bonspiels::New, class: "btn btn-primary"
            end
          end
        end
      end
    end
  end
end
