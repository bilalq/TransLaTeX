# $Id$
#
# Grammar for TransLaTex

class Translatex
  prechigh
    #Do I need anything here???
  preclow
rule
  statement: '(' sexpr ')'

  sexpr: '(' sexpr ')'
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
    
  members: symbol members
         | NUMBER
         | 
  symbol: 'inf'
        | '$pi'
        | '$Pi'
        | '$epsilon'
        | '$Epsilon'
        | '$theta'
        | '$Theta'
        | '$nu'
        | '$Nu'
end
