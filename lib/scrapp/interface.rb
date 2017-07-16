module Scrapp

  require 'terminal-table'

  class CLI
    def render_panel(content, flag)
      Terminal::Table::Style.defaults = { width: 70 }
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
      render_panel(BONUS_GUIDE, 'bonus_guide')
      $stdout.write "\e[14;23H"
      Scrapp::Scrabble.new(gets.chomp)
      exit_session
    end

    def score_again?
      # prompt = TTY::Prompt.new
      render_panel(POST_SCORE, 'status')
    end

    def exit_session
      $stdout.write "\e[35;70H\n"
    end
  end
end
