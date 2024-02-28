# Create custom nagios_mongod fact

binaries = [
  '/usr/bin/mongod',
  '/usr/local/mongodb/bin/mongod',
]

binaries.each do |filename|
  if FileTest.exist?(filename)
    Facter.add('nagios_mongod') { setcode { true } }
  end
end

