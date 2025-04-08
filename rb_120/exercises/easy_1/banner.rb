class Banner
  MAX_WIDTH = 80
  def initialize(message, banner_size= (message.size + 4))
    @message = message
    @default_size = message.size + 4
    @banner_size = banner_size <= MAX_WIDTH ? banner_size : @default_size
    @banner_size = @banner_size >= @default_size ? @banner_size : @default_size
    @mod_message_width = @banner_size - 4
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + filler_string('-') + "-+"
  end

  def empty_line
    "| " + filler_string(' ') + " |"
  end

  def message_line
    "| #{@message.center(@mod_message_width)} |"
  end

  def filler_string(character)
    character * @mod_message_width
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 15)
puts banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner = Banner.new('', 20)
puts banner
=begin
+--+
|  |
|  |
|  |
+--+
=end