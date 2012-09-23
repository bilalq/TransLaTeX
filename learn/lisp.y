# $Id$
#
# Very simple lisp.

class Lispp
rule
  target: '(' sexpr ')'       { result = "" }
        #| '(' atom ')'       { result = val.join('gap')  }
        ;

  sexpr: func '(' sexpr ')'   { result += "\\#{val[0]} " }
       | func atom
       ;

  func: 'lim'                 { result = result }
      | 'sum'                 { result = result }
      | '+'                   { result = result }
      | '-'                   { result = result }
      | '*'                   { result = result }
      | '/'                   { result = result }
      ;

  #atom: NUMBER              { result = val.join('gap')  }
      #| SYMBOL              { result = val.join('gap')  }
      #| STRING              { result = val.join('gap')  }
      #;

  #sexpr:
       #| '(' func sexpr ')' { result += "matched sexpr" }
       #| '(' 'section' ')'  { result += "section hit"   }
       #| atom               { result += "matched atom"  }
       #;

  #func: 'lim'               { result += "matched lim"   }
      #| 'sum'               { result += "matched sum"   }
      #| '+'                 { result += "op"            }
      #;

  #atom: NUMBER              { result += "matched num"   }
      #| SYMBOL              { result += "matched sym"   }
      #| STRING              { result += "section str"   }
      #;
end


---- header
# $Id$
---- inner

def parse(str)
  input = str.split " "
  @q = []
  input.each do |curr|
    @q.push [curr, curr]
  end
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
