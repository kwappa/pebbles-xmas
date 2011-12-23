# -*- coding: utf-8 -*-
require 'pebbles'

class Pebbles::Xmas
  VERSION = '0.1.0'

  S  = ' ' + [0x2605].pack('U')
  F  = [0xff0f].pack('U')
  B  = [0xff3c].pack('U')
  O  = [0x0069, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020,
        0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020,
        0x0020, 0x2E1B, 0x2042, 0x2E2E, 0x0026, 0x0040,
        0xFF61,].pack('U*').split('')
  OC = [21, 33, 34, 35, 36, 37]
  L  = [0x005e].pack('U')

  def self.tree h = 20
    h = 20 unless h > 0
    puts "\n#{' ' * h}\033[33m#{S}"
    m = h * 2 - 1
    (h - 1).times do |l|
      o = (l + 1) * 2 - 2
      s = (m - o) / 2 + 1
      print "#{' ' * s}\033[32m#{F}"
      o.times { print "\033[#{OC[rand(OC.length)]}m#{O[rand(O.length)]}" }
      puts "\033[32m#{B}"
    end
    print " \033[32m#{L * (h - 1)}|  |#{L * (h - 1)}"
    print "\n#{' ' * h}|  |#{' ' * (h - 1)}" if h > 10
    puts
    puts "\033[37mHappy Xmas, \033[31mRubyists!"
  end
end
