# # encoding: utf-8

pkg = if os.debian?
        'slapd'
      elsif os.redhat?
        'openldap-servers'
      elsif os.suse?
        'openldap2'
      elsif os.linux?
        'openldap-servers'
      elsif os.bsd?
        'openldap-server'
      end

config = if os[:family] == 'redhat' && os[:release].start_with?('7')
           '/etc/sysconfig/slapd'
         elsif os.redhat?
           '/etc/sysconfig/ldap'
         end

describe package(pkg) do
  it { should be_installed }
end

describe service('slapd') do
  it { should be_installed }
  it { should be_running }
end

describe file(config) do
  it { should be_file }
end
