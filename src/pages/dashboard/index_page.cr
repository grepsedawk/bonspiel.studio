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

      div class: "px-4 py-5 sm:p-6" do
        h2 "Upcoming and Ongoing"
        ul do
          bonspiels.each do |bonspiel|
            li do
              link bonspiel.to_s, Bonspiels::Show.with(bonspiel), class: "link"
            end
          end
        end

        link "New Bonspiel", to: Bonspiels::New, class: "link link-accent"
      end
    end
  end
end
