# $Id$
#
# Very simple lisp.

class Lispp
rule
  target: '(' 'sexpr' ')'   { p "start"          }
        ;

  sexpr: atom               { p += "matched atom"  }
       | '(' func sexpr ')' { p += "matched sexpr"      }
       | '(' 'section' ')'  { p += "section hit"        }
       ;

  atom: NUMBER              { p += "matched num"        }
      | SYMBOL              { p += "matched sym"        }
      | STRING              { p += "section str"        }
      ;

  func: 'lim'               { p += "matched lim"        }
      | 'sum'               { p += "matched sum"        }
      ;
end


---- header
# $Id$
---- inner

def parse(str)
  @q = []
  #until str.empty?
    #s = $&
    #@q.push [s, s]
  #end
  @q.push [false, '$end']
  do_parse
end

def next_token
  @q.shift
end

---- footer

parser = Lispp.new
puts
puts 'Type "Q" to quit'
puts
while true
  puts
  print '? '
  str = gets.chop!
  break if /q/i =~ str
  begin
    puts "= #{parser.parse(str)}"
  rescue ParseError
    puts $!
  end
end
