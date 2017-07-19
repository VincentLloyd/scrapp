module Scrapp

  require 'io/console'
  require 'terminal-table'

  class CLI

    attr_reader :run

    def initialize
      @run = true
    end

    def cursor(flag, *p)
      code = case flag
        when 'hide' then '?25l' # Hide cursor
        when 'show' then '?25h' # Show cursor
        when 'move' then "#{p[0]};#{p[1]}H" # Move cursor to row & col
      end
      $stdout.write"\e[#{code}"
    end

    def render_panel(content, flag)
      Terminal::Table::Style.defaults = { width: 75 }
      panel = Terminal::Table.new do |row|
        row.rows = content
        apply_border(row, flag)
      end
      panel.align_column(0, :center) if flag != 'prompt' 
      cursor('move', 13) if flag == 'prompt'
      cursor('move', 45) if flag == 'status' 
      puts panel
    end

    def apply_border(row, flag)
      if ['bonus_mid', 'intro', 'prompt'].include? flag 
        row.style = { border_top: false, border_bottom: false }
      elsif ['bonus_btm', 'status'].include? flag
        row.style = { border_top: false }
      elsif ['bonus_top', 'status'].include? flag
        row.style = { border_bottom: false }
      end
    end

    def print_cli 
      system 'clear'
      render_panel(HEADER, 'header')
      render_panel(INTRO, 'intro')
      render_panel(PROMPT, 'prompt')
      render_panel(BONUS_LETTER, 'bonus_top')
      render_panel(BONUS_WORD, 'bonus_mid')
      render_panel(BONUS_BINGO, 'bonus_btm')
      render_panel(TRIVIA, 'status')
    end

    def get_word
      cursor 'show'
      cursor('move', 14, 33)
      gets.chomp
    end

    def print_error(word, error_code)
      cursor('move', 14, 33)
      puts "\e[1m\e[31m#{word}\e[0m"
      cursor('move', 15, 33)
      puts "\e[1m\e[31mINVALID INPUT!\e[0m"
      render_panel(ERROR[error_code - 1], 'status')
      cursor 'hide'
      STDIN.getch
    end
    
    def print_score(word, score)
      cursor('move', 14, 33)
      puts "\e[1m\e[32m#{word}\e[0m"
      cursor('move', 15, 33)
      puts "\e[1m\e[32m#{score}\e[0m"
    end

    def score_again?
      cursor 'hide'
      render_panel(SCORE_AGAIN, 'status')
      continue? STDIN.getch
    end

    def continue?(key) 
      if ['y', 'Y'].include? key
        return
      elsif ['n', 'N'].include? key
        @run = false
      else
        continue? STDIN.getch
      end 
    end

    def end_session
      render_panel(FAREWELL, 'status')
      sleep 2
      cursor 'show'
      system 'clear'
    end
  end
end
