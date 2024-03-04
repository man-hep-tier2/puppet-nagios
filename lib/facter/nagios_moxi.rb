# Create custom nagios_moxi fact if moxi is found

if FileTest.exist?('/opt/moxi/bin/moxi')
  Facter.add('nagios_moxi') { setcode { true } }
end

