# More info at https://github.com/guard/guard#readme

guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/test_helper\.rb$})      { 'test' }
  watch(%r{^test/(.*)_test\.rb$})
  watch(%r{^lib/(.+)\.rb$})              { 'test' }

  # with Minitest::Spec
  watch(%r{^test/(.*)_spec\.rb$})
  # watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
end
