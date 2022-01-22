class Dashboard::IndexPage < MainLayout
  needs bonspiels : BonspielQuery

  def page_title
    "Dashboard"
  end

  def content
    div class: "bg-white overflow-hidden shadow rounded-lg" do
      div class: "border-b border-gray-200 px-4 py-5 sm:px-6" do
        h1 "Your Dashboard", class: "font-medium text-lg"
      end

      div class: "px-4 py-5 sm:p-6" do
        h2 "Upcoming and Ongoing"
        ul do
          bonspiels.each do |bonspiel|
            li do
              link bonspiel.name, Bonspiels::Show.with(bonspiel)
            end
          end
        end

        link "New Bonspiel", to: Bonspiels::New
      end
    end
  end
end
