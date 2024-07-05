
peinstall='https://pm.puppet.com/cgi-bin/download.cgi?dist=el&rel=9&arch=x86_64&ver=latest'

dnf update -y --quiet
dnf install -y --quiet langpacks-de tar epel-release bash-completion vim jq git emacs

cat >~/pe.conf <<PECONF
{
  "puppet_enterprise::profile::master::r10k_remote": "https://github.com/marcusdots/buggedcontrolrepo.git",
  "puppet_enterprise::profile::master::code_manager_auto_configure": true,
  "puppet_enterprise::profile::master::r10k_git_provider": "shellgit",
  "console_admin_password": "topsecret-thahj^oht3uph4ahSa0t",
  "puppet_enterprise::puppet_master_host": "pe.marcus.betadots.training"
  "puppet_enterprise::profile::console::numbers_required": 0
  "puppet_enterprise::profile::console::uppercase_letters_required": 0
  "puppet_enterprise::profile::console::password_minimum_length": 8
  "puppet_enterprise::profile::console::special_characters_required": 0
}
PECONF

curl --remote-header-name --location --remote-name "$peinstall"
tar xf puppet-enterprise-*-x86_64.tar.gz
rm -f puppet-enterprise-*.tar.gz
cd puppet-enterprise-*-x86_64/
./puppet-enterprise-installer -c ~/pe.conf
puppet infra console_password
