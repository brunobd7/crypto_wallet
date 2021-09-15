namespace :dev do
  desc "Setup development environment - Test task from course rails"
  task setup: :environment do

    if Rails.env.development?

      # IF METHOD CONTAINS ONLY LINE 'do' IS NOT REQUIRE TO USE 'yield' WITH RUBY BLOCK OF CODE
      show_spinner("DB DROP") { puts %x(rails db:drop) }
      show_spinner("DB CREATE") { puts %x(rails db:create)}
      show_spinner("DB MIGRATE") { puts %x(rails db:migrate) }
      show_spinner("DB SEED") { puts %x(rails db:seed) }

    end

  end

  def show_spinner(start_msg, end_msg = "Completed successful!")

    spinner = TTY::Spinner.new("[:spinner] #{start_msg} ...", format: :pulse_2)
    spinner.auto_spin

    yield

    spinner.success(end_msg)

  end

end
