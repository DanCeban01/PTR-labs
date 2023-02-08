Mix.install([
  {:req, "~> 0.2"},
  {:floki, "~> 0.30.0"}
])

resp = Req.get!("https://github.com/elixir-lang")

resp.body
|> Floki.parse_document!()
|> Floki.find(~s{[data-hovercard-type="repository"]})
|> Enum.map(&Floki.text/1)
|> Enum.map(&String.trim/1)
|> Enum.each(&IO.puts/1)
