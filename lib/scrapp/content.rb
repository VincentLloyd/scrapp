module Scrapp

  require 'artii'
  
  TITLE = Artii::Base.new font: 'slant'

  HEADER = [
    [TITLE.asciify('SCRAPP')],
    ["\e[1mA SCRABBLE WORD SCORE APP\e[0m\n "]
  ].freeze

  INTRO = [
    ["\nEnter a word at the prompt to calculate its Scrabble score\n "]
  ].freeze

  PROMPT = [
    ["\n" + ' ' * 9 + "\e[1mYour word:\e[0m"],
    [' ' * 8 + "\e[1mWord score:\e[0m\n "]
  ].freeze

  BONUS_GUIDE = [
    ["\n\e[1m\e[33mLETTER BONUS\e[0m"],
    ["\n\e[33mDOUBLE LETTER\e[0m score => <letter>\e[1m*\e[0m"],
    ["\e[1mho*pe\e[0m = \e[1mhope\e[0m" \
     " word score inc. double letter score \e[1mo\e[0m"],
    ["\n\e[33mTRIPLE LETTER\e[0m score => <letter>\e[1m**\e[0m"],
    ["\e[1mva**st\e[0m = \e[1mvast\e[0m" \
     " word score inc. triple letter score \e[1ma\e[0m"],
    ["\n\e[1m\e[31mWORD BONUS\e[0m"],
    ["\n\e[31mDOUBLE WORD\e[0m score => \e[1m!\e[0m<word>"],
    ["\e[1m!hello\e[0m = \e[1mhello\e[0m with double word score"],
    ["\n\e[31mTRIPLE WORD\e[0m score => \e[1m!!\e[0m<word>"],
    ["\e[1m!!fancy\e[0m = \e[1mfancy\e[0m with triple word score\n "]
  ].freeze

  POST_SCORE = [
    ["\nScore another word? (Y/n)\n "]
  ]
end
