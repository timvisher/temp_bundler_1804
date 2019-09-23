apt_update 'bundler'

apt_package 'bundler'

# TODO generate a Gemfile and then run bundle install
file '/home/vagrant/Gemfile' do
  content <<-EOF
    source 'https://rubygems.org'
    gem 'rake', '10.0.4'
  EOF
end

execute 'bundle install' do
  command 'bundle install'
  cwd '/home/vagrant'
  user 'vagrant'
  environment ({'HOME' => '/home/vagrant'})
end
