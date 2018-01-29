defmodule ExCmcTest do
  use ExUnit.Case
  doctest ExCmc

  test "greets the world" do
    assert ExCmc.hello() == :world
  end
end
