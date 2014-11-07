current_dir = File.dirname(__FILE__)
node_name 'dchauviere'
client_key "#{current_dir}/dchauviere.pem"
chef_server_url "https://172.17.0.2/organizations/demo/"
syntax_check_cache_path "#{current_dir}/syntax_check_cache"
cookbook_path ["#{current_dir}/../cookbooks"]
validation_client_name   "demo-validator"
validation_key           "#{current_dir}/demo-validator.pem"
chef_server_root         "https://172.17.0.2"