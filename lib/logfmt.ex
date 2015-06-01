defmodule Logfmt do
  @doc ~S"""
  Decodes the given line into a map

  ## Examples

      iex> Logfmt.decode "foo=bar baz=qux"
      %{"foo" => "bar", "baz" => "qux"}

      iex> Logfmt.decode ~s(foo="bar baz")
      %{"foo" => "bar baz"}

      iex> Logfmt.decode "foo=true"
      %{"foo" => true}

      iex> Logfmt.decode "foo=1"
      %{"foo" => 1}
  """
  @spec decode(String.t) :: map
  def decode(string) do
    Logfmt.Decoder.decode(string)
  end

  @doc ~S"""
  Encodes the given keyword list into a Logfmt-style line

  ## Examples

      iex> Logfmt.encode [foo: "bar"]
      "foo=bar"

      iex> Logfmt.encode [foo: "bar baz"]
      "foo=\"bar baz\""
  """
  @spec encode(Keyword.t) :: String.t
  def encode(list) do
    Logfmt.Encoder.encode(list)
  end
end
