defmodule ExCmc.API do

  def fetch_latest_price(crypto_currency) do

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

  def fetch_latest_price(crypto_currency, fiat_currency) do
    IO.puts "Fetch latest price of #{crypto_currency} in #{fiat_currency}"

    name = convert_code_to_name(crypto_currency)
    url = "https://api.coinmarketcap.com/v1/ticker/#{name}/?convert=#{fiat_currency}"

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
