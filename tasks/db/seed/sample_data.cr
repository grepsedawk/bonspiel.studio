require "../../../spec/support/factories/**"

# Add sample data helpful for development, e.g. (fake users, blog posts, etc.)
#
# Use `Db::Seed::RequiredData` if you need to create data *required* for your
# app to work.
class Db::Seed::SampleData < LuckyTask::Task
  summary "Add sample database records helpful for development"

  def call
    # Using an Avram::Factory:
    #
    # Use the defaults, but override just the email
    # UserFactory.create &.email("me@example.com")

    # Using a SaveOperation:
    #
    # ```
    # SignUpUser.create!(email: "me@example.com", password: "test123", password_confirmation: "test123")
    # ```
    #
    # You likely want to be able to run this file more than once. To do that,
    # only create the record if it doesn't exist yet:
    #
    # ```
    if UserQuery.new.email("admin@localhost").none?
      SignUpUser.create!(
        email: "admin@localhost",
        password: "demo123",
        password_confirmation: "demo123"
      ).tap do |user|
        SaveBonspiel.create!(
          name: "Test Bonspiel",
          start_at: Time.utc,
          end_at: Time.utc + 3.days,
          owner_id: user.id,
          sheets: 5
        ).tap do |bonspiel|
          10.times do |n|
            SaveDraw.create!(
              start_at: Time.utc + n.minutes * 15,
              bonspiel_id: bonspiel.id
            )
          end
        end
      end
    end
    # ```
    puts "Done adding sample data"
  end
end
