namespace :dev do
  desc "Configura o ambiente de desemvolvimento"
  task setup: :environment do
  	if Rails.env.development?

	show_spinner("Apagando BD...") {%x(rails db:drop)}
  
  show_spinner("Creando BD...") {%x(rails db:create)}
  	
  show_spinner("Migrando BD...") {%x(rails db:migrate)}

  %x(rails dev:add_mining_types)

	%x(rails dev:add_coins)
  	
  	else
  		puts "Você não esta em ambiente de desemvolvimento"
  	end
end

desc "Cadastra as moedas"
task add_coins: :environment do
  show_spinner("Cadastrando moedas...") do

      coins=[
            { 
            moeda:"Bitcoin",
            sigla:"BTC",
            url_imagem:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png",
            mining_type: MiningType.find_by(acronym: 'PoW')
            },
            {
            moeda:"Etherium",
            sigla:"ETH",
            url_imagem:"https://miro.medium.com/max/294/1*iI35kRC5yZ5d6rxsM-wmog.png",
            mining_type: MiningType.all.sample
            },
            {
            moeda:"Dash",
            sigla:"DASH",
            url_imagem:"https://wiki.trezor.io/images/Dash.png",
            mining_type: MiningType.all.sample
            },
            {
            moeda:"Iota",
            sigla:"IOT",
            url_imagem:"https://wiki.trezor.io/images/Dash.png",
            mining_type: MiningType.all.sample
            },
            {
            moeda:"Zcash",
            sigla:"ZEC",
            url_imagem:"https://wiki.trezor.io/images/Dash.png",
            mining_type: MiningType.all.sample
            }
          ]

    coins.each do |coin|
      Coin.find_or_create_by(coin)
    end
  end
end

  desc "Cadastra os tipos de mineração"
    task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de moneração...") do
    mining_types = [
      {description: "Proof of Work", acronym: "PoW"},
      {description: "Proof of Stake", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"}

    ]
    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
  end
end

private

def show_spinner(msg_start, msg_end = "Concluido!")
	spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
	spinner.auto_spin
	yield
	spinner.success("(#{msg_end})")
	
	end
end
