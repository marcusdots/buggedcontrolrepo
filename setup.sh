
peinstall='https://pm.puppet.com/cgi-bin/download.cgi?dist=el&rel=9&arch=x86_64&ver=latest'

dnf update -y --quiet
dnf install -y --quiet langpacks-de tar epel-release bash-completion vim jq git emacs tig

cat >~/pe.conf <<PECONF
{
  "puppet_enterprise::profile::master::r10k_remote": "https://github.com/marcusdots/buggedcontrolrepo.git",
  "puppet_enterprise::profile::master::code_manager_auto_configure": true,
  "puppet_enterprise::profile::master::r10k_git_provider": "shellgit",
  "console_admin_password": "topsecret",
  "puppet_enterprise::puppet_master_host": "pe.marcus.betadots.training"
}
PECONF

curl --remote-header-name --location --remote-name "$peinstall"
tar xf puppet-enterprise-*-x86_64.tar.gz
rm -f puppet-enterprise-*.tar.gz
cd puppet-enterprise-*-x86_64/
./puppet-enterprise-installer -c ~/pe.conf
puppet infra console_password
