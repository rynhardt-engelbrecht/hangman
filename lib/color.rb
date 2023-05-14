# frozen_string_literal: true

# module used to add colors to text
module Colors
  def green(text)
    "\e[92;1m#{text}\e[0m"
  end

  def red(text)
    "\e[91;1m#{text}\e[0m"
  end
end
