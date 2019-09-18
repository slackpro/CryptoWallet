# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins=[
			{	
 			moeda:"Bitcoin",
 			sigla:"BTC",
 			url_imagem:"https://upload.wikimedia.org/wikipedia/commons/c/cf/Bitcoin.com_logo.png"
 			},
 			{
			moeda:"Etherium",
			sigla:"ETH",
			url_imagem:"https://miro.medium.com/max/294/1*iI35kRC5yZ5d6rxsM-wmog.png"
			},
			{
			moeda:"Dash",
			sigla:"DASH",
			url_imagem:"https://wiki.trezor.io/images/Dash.png"
			},
			{
			moeda:"Iota",
			sigla:"IOT",
			url_imagem:"https://wiki.trezor.io/images/Dash.png"
			},
			{
			moeda:"Zcash",
			sigla:"ZEC",
			url_imagem:"https://wiki.trezor.io/images/Dash.png"
			}
		]


coins.each do |coin|
	Coin.find_or_create_by(coin)
end

spinner.success("(Concluido!)")