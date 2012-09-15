Gem::Specification.new do |s|
  s.name        = 'ratex'
  s.version     = '0.0.1'
  s.date        = '2012-09-15'
  s.summary     = 'A Lisp syntax for LaTex that specializes in math.'
  s.description = 'An alternative syntax that removes the tedious nature of LaTex'
  s.authors     = ['Bilal Quadri']
  s.email       = 'bilalquadir92@gmail.com'
  s.files       = ['lib/translatex.rb']
  s.add_runtime_dependency 'racc',
    ['= 1.4.9']
  s.add_runtime_dependency 'rex',
    ['= 1.0.2']
end
