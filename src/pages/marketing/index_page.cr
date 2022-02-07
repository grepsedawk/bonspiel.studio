class Marketing::IndexPage < AuthLayout
  def content
    div class: "relative bg-gray-50 overflow-hidden" do
      render_hero
      render_features
    end
  end

  private def render_hero
    div class: "flex items-center w-full px-4 py-10 bg-cover card bg-base-200", style: "background-image:url(#{asset("images/marketing-hero.jpg")})" do
      div class: "card glass lg:card-side text-ascent" do
        iframe allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture", allowfullscreen: "", frameborder: "0", height: "315", src: "https://www.youtube.com/embed/-_7y7jLqOQA?start=5079", title: "YouTube video player", width: "560"
        div class: "max-w-md card-body" do
          h2 "See it in use!", class: "card-title"
          para do
            text "Since the 2022 Men's Bonspiel, "
            link "bonspiel.studio", Home::Index
            text " has been "
            a "Milwaukee Curling Club", href: "https://www.youtube.com/channel/UChL2fBTC1otaK7rIWBHIUKw", class: "link"
            text "'s solution for streaming scoreboard standings using OBS Browser Sources."
          end
          div class: "card-actions" do
            link "Sign Up", SignUps::New, class: "btn rounded-full", flow_id: "sign-up-button"
            link "Sign In", SignIns::New, class: "btn rounded-full", flow_id: "sign-in-button"
          end
        end
      end
    end
  end

  private def render_features
    div class: "py-12 bg-white" do
      div class: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" do
        div class: "lg:text-center" do
          h2 "Features", class: "text-base text-primary-600 font-semibold tracking-wide uppercase"

          para class: "mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl" do
            text "The Swiss army knife of Bonspiel Studios"
          end

          para class: "mt-4 max-w-2xl text-xl text-gray-500 lg:mx-auto" do
            text "From bracket management to scoreboard streaming, we have you covered!"
          end
        end
        div class: "mt-10" do
          dl class: "space-y-10 md:space-y-0 md:grid md:grid-cols-2 md:gap-x-8 md:gap-y-10" do
            div class: "flex" do
              div class: "shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Access from Anywhere"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "No need to setup a local server to host Bonspiel Studio. Bonspiel Studio is available worldwide."
                end
              end
            end
            div class: "flex" do
              div class: "shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Track Score in Real Time"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "With the main Bonspiel dashboard, track the score in real time to be presented on stream."
                end
              end
            end
            div class: "flex" do
              div class: "shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M13 10V3L4 14h7v7l9-11h-7z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Bonspiel Wizard"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "With the bonspiel wizard, automatically break the tournament into automatic event tracking. Teams can know when they play next as soon as their game is over!"
                end
              end
            end
            div class: "flex" do
              div class: "shrink-0" do
                div class: "flex items-center justify-center h-12 w-12 rounded-md bg-primary-500 text-white" do
                  tag "svg", aria_hidden: "true", class: "h-6 w-6", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24", xmlns: "http://www.w3.org/2000/svg" do
                    tag "path", d: "M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2"
                  end
                end
              end
              div class: "ml-4" do
                dt class: "text-lg leading-6 font-medium text-gray-900" do
                  text "Get running fast!"
                end
                dd class: "mt-2 text-base text-gray-500" do
                  text "Very easy, simple configuration to get to streaming without the need for a fully managed bonspiel."
                end
              end
            end
          end
        end
      end
    end
  end

  private def render_right_rectangle_background
    tag "svg", class: "absolute left-full transform -translate-y-3/4 -translate-x-1/4 md:-translate-y-1/2 lg:-translate-x-1/2", fill: "none", height: "784", viewBox: "0 0 404 784", width: "404" do
      rectangle_background
    end
  end

  private def rectangle_background
    tag "defs" do
      tag "pattern", height: "20", id: "5d0dd344-b041-4d26-bec4-8d33ea57ec9b", patternUnits: "userSpaceOnUse", width: "20", x: "0", y: "0" do
        tag "rect", class: "text-gray-200", fill: "currentColor", height: "4", width: "4", x: "0", y: "0"
      end
    end
    tag "rect", fill: "url(#5d0dd344-b041-4d26-bec4-8d33ea57ec9b)", height: "784", width: "404"
  end
end
