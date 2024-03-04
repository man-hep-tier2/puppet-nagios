# Create custom nagios_redis fact
if FileTest.exist?('/usr/bin/redis-server')
  Facter.add('nagios_redis') { setcode { true } }
end
