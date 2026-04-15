class MarkdownConverter
    def initialize
            
    end

    def convert(text)
        line = text.strip
        if line.start_with?("# ")
            return convert_header(line)
        end

        processed_text = conver_bold(line)
        "<p>#{processed_text}</p>"
    end

    def transform_text_block(multiple_lines)
        lines = multiple_lines.split("\n")

        lines_to_html = lines.map do |line|
            convert(line)  
        end

        lines_to_html.join("/n")
    end

    private

    def convert_header(text)
        header = text.sub("#", "").strip
        "<h1>#{header}</h1>"   
    end

    def conver_bold(text)
        text.gsub(/\*\*(.*?)\*\*/, '<strong>\1</strong>')    
    end


end

converter = MarkdownConverter.new 
puts converter.convert("# If you see this, it works!")
puts converter.convert("# If you don't? it didn't work")

test_markdown = <<~MARKDOWN
  # Project Ruby
  Ruby is **fast** and **fun**.
  ## Getting Started
  You just need to write **clean code**.
  This is a regular paragraph without any flair.
MARKDOWN


puts "--- HTML OUTPUT ---"
puts converter.transform_text_block(test_markdown)