namespace :dev do
  desc "Setup development environment - Test task from course rails"
  task setup: :environment do

    if Rails.env.development?

      spinner = TTY::Spinner.new("[:spinner] Starting dev enviroment ...", format: :arrow_pulse)
      # spinner.auto_spin
      # puts %x(rails db:drop db:create db:migrate db:seed)
      puts %x(rails db:drop)
      puts %x(rails db:create)
      puts %x(rails db:migrate)
      puts %x(rails db:seed)

      # spinner.stop("Completed!")
      spinner.success('(successful upper enviroment!)')
    end

  end

end
