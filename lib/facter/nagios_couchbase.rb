# Create custom nagios_couchbase fact if couchbase is found

if FileTest.exist?('/opt/couchbase/bin/cbstats')
  Facter.add('nagios_couchbase') { setcode { true } }
end

