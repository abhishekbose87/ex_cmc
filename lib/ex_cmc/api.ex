defmodule ExCmc.API do

  def fetch_latest_prices do
    url = "https://api.coinmarketcap.com/v1/ticker/?limit=10"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Poison.decode!(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def fetch_latest_price(crypto_currency) do
    name = convert_code_to_name(crypto_currency)
    fetch_api_data(name, "USD")
  end

  def fetch_latest_price(crypto_currency, fiat_currency) do
    fetch_api_data(crypto_currency, fiat_currency)
  end

  defp fetch_api_data(crypto_currency, fiat_currency) do
    name = convert_code_to_name(crypto_currency)
    url = "https://api.coinmarketcap.com/v1/ticker/#{name}/"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp convert_code_to_name(code) do
    map = %{
      "XRP" => "Ripple",
      "BTC" => "Bitcoin",
      "ETH" => "Ethereum",
      "LTC" => "Litecoin",
     }
     map[code]
  end

end
