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