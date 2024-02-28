# Create custom nagios_zookeeper fact if zookeeper is found

if FileTest.exist?('/usr/share/java/zookeeper')
  Facter.add('nagios_zookeeper') { setcode { true } }
end

