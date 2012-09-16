# $Id$
#
# Grammar for TransLaTex

class Translatex
  prechigh
    #Do I need anything here???
  preclow
rule
  statement: '(' sexpr ')'

  sexpr: '(' sexpr ')' {'(' + 'banana' + sexpr +')'}
       | func members
       | 'section'

  sexpr -> <id> | ( sexpr . sexpr)

        '(' 'frac' sexpr ')'  {'\frac{' val[3] '}'}


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

