defmodule ExCmc do

  alias ExCmc.API

  defdelegate fetch_latest_price(crypto_currency, fiat_currency), to: API
  defdelegate fetch_latest_price(crypto_currency), to: API

  defdelegate fetch_latest_prices, to: API
end
