module Scrapp

  require 'terminal-table'

  class CLI

    attr_accessor :continue

    def initialize
      @continue = true
    end

    def render_panel(content, flag)
      Terminal::Table::Style.defaults = { width: 75 }
      panel = Terminal::Table.new do |row|
        row.rows = content
        apply_border(row, flag)
      end
      flag != 'prompt' ? panel.align_column(0, :center) : ''
      puts panel
    end

    def apply_border(row, flag)
      if ['intro', 'prompt'].include?(flag) 
        row.style = { border_top: false, border_bottom: false }
      elsif flag == 'status'
        row.style = { border_top: false }
      end
    end

    def new_session
      system 'clear'
      render_panel(HEADER, 'header')
      render_panel(INTRO, 'intro')
      $stdout.write "\e[13;H"
      render_panel(PROMPT, 'prompt')
      render_panel(BONUS_GUIDE, 'guide')
      render_panel(TRIVIA.sample, 'status')
      $stdout.write "\e[14;23H"
    end

    def print_score(word)
      $stdout.write "\e[14;23H"
      puts "\e[1m\e[32m#{word}\e[0m"
      $stdout.write "\e[15;23H"
      puts "\e[1m\e[32mVALID!\e[0m"
    end

    def score_again?
      $stdout.write "\e[36;H"
      render_panel(SCORE_AGAIN, 'status')
      $stdout.write "\e[39;43H"
      @continue = gets.chomp
    end

    def handle_error(error_code)
      $stdout.write "\e[36;H"
      render_panel(ERROR[error_code - 1], 'status')
      gets.chomp
    end

    def exit_session
      $stdout.write "\e[35;70H\n"
    end
  end
end
