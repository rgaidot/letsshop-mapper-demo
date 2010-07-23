require "letsshop_mapper"
config = YAML.load_file(Rails.root + 'config' + 'letsshop.yml')[Rails.env]
LSHOP = LetsShopMapper::Connection::Base::new(config["server"], config["key"])