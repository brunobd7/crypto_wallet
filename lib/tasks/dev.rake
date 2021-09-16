namespace :dev do

  desc "Setup development environment - Test task from course rails"
  task setup: :environment do

    if Rails.env.development?

      # IF METHOD CONTAINS ONLY LINE 'do' IS NOT REQUIRE TO USE 'yield' WITH RUBY BLOCK OF CODE
      show_spinner("DB DROP") { puts %x(rails db:drop) }
      show_spinner("DB CREATE") { puts %x(rails db:create)}
      show_spinner("DB MIGRATE") { puts %x(rails db:migrate) }
      # show_spinner("DB SEED") { puts %x(rails db:seed) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)

    end

    end

  desc "Load coins datas"
  task add_coins: :environment do

    if Rails.env.development?

      coins =
        [
          { description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-2048.png",
          },
          { description: "Ethereum",
            acronym: "ETH",
            url_image: "https://www.pikpng.com/pngl/m/25-250845_ethereum-png-kuma-restaurant-rabat-clipart.png",
          },
          { description: "Dash",
            acronym: "DASH",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
          },
          { description: "Cardano",
            acronym: "CDN",
            url_image: "https://w7.pngwing.com/pngs/844/873/png-transparent-cardano-zug-cryptocurrency-blockchain-ethereum-bitcoin-wallet-thumbnail.png",
          }
        ]

      coins.each do |coin|

        show_spinner("Register coin") { Coin.find_or_create_by!(coin) }

      end
    end

  end

  desc "Add mining types"
  task add_mining_types: :environment do

    if Rails.env.development?

      minings =
        [
          { description: "Proof of Work",
            acronym: "PoW"
          },
          { description: "Proof of Stake",
            acronym: "PoS"
          },
          { description: "Proof of Capacity",
            acronym: "PoC"
          }
        ]

      minings.each do |mining_type|

        show_spinner("Register Mining Type ") { MiningType.find_or_create_by!(mining_type) }

      end
    end


  end

  private
  def show_spinner(start_msg, end_msg = "Completed successful!")

    spinner = TTY::Spinner.new("[:spinner] #{start_msg} ...", format: :pulse_2)
    spinner.auto_spin

    yield

    spinner.success(end_msg)

  end

end
