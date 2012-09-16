# $Id$
#
# Grammar for TransLaTex

class Translatex
rule
  statement: '(' sexpr ')' { result = '' }

  sexpr: '(' sexpr ')' { result }
       | func members
       | 'section'

  func: '#'
      | '+'
      | '-'
      | '*'
      | '/'
      | '^'
      | 'log'
      | 'lim'
      | 'sum'
      | 'prod'
      | 'frac'
      | 'title'
      | '\\'

  members: symbol members
         | NUMBER members
         | NUMBER
         | WORD members
         | WORD

  symbol: '$inf'
        | '$pi'
        | '$Pi'
        | '$epsilon'
        | '$Epsilon'
        | '$theta'
        | '$Theta'
        | '$nu'
        | '$Nu'
end
