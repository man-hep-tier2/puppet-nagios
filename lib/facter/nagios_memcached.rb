# Create custom nagios_memcached if memcached is found

if FileTest.exist?('/usr/bin/memcached')
  Facter.add('nagios_memcached') { setcode { true } }
end

