def cs_word(word)
  if word.downcase[-2, 2] == 'cs'
    puts 2**word.length
  else
    puts word.reverse
  end
end
