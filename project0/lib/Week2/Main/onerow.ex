defmodule Row do
  def words_from_one_row(words) do
    row1 = "qwertyuiop"
    row2 = "asdfghjkl"
    row3 = "zxcvbnm"

    Enum.filter(words, fn word ->
     row = if String.contains(row1, String.downcase(hd(word))) do
        row1
      else if String.contains(row2, String.downcase(hd(word))) do
        row2
      else
        row3
      end
    end
      Enum.all?(word, fn char -> String.contains(row, String.downcase(char))end)
  end)
  end
end

IO.inspect Row.words_from_one_row("asd", "wsd")
