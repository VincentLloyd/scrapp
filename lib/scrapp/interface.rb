module Scrapp

  require 'terminal-table'

  module Interface
    def self.render_text_panel(content)
      set_table_defaults
      text_panel = Terminal::Table.new { |row| row.rows = content }
      text_panel.align_column(0, :center)
      puts text_panel
    end

    def self.render_score_panel(content)
      set_table_defaults
      score_panel = Terminal::Table.new do |row|
        row.rows = content
        row.style = { border_top: false, border_bottom: false }
      end
      puts score_panel
    end

    def self.new_session
      system 'clear'
      render_text_panel(HEADER)
      render_score_panel(SCORE_WORD)
      render_text_panel(BONUS_GUIDE)
      $stdout.write "\e[19;23H"
      game = Scrapp::Scrabble.new(gets.chomp)
      puts game.word
      $stdout.write "\e[40;70H\n"
    end

    private

    def self.set_table_defaults
      Terminal::Table::Style.defaults = { width: 70 }
    end
  end
end
