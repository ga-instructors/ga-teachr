require 'pry'
require 'ansi'

[STDOUT, STDERR].each do |pipe|
  pipe.define_singleton_method(:write) do |*args|
    writer, method = caller[1].split(':in ')

    if $debug_puts_writer == writer
      $debug_puts_count += 1
    else
      $debug_puts_count = 1
      $debug_puts_writer = writer
    end

    unless writer =~ /ruby-progressbar/ || writer =~ /fuubar/ || writer =~ /benchmark/ || writer =~ /rspec\/core\/formatters/ || periodically
      super "\n" + ANSI.yellow { " #{writer} ".center(ANSI::Terminal.terminal_width - method.length, '-') + method }
    end
    super(*args)
  end

  private

  def periodically
    $debug_puts_count % 10 != 1
  end

end
