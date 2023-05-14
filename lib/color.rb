module Colors
  def green(text)
    "\e[92;1m#{text}\e[0m"
  end

  def red(text)
    "\e[91;1m#{text}\e[0m"
  end
end
