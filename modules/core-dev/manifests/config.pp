# Adjust the default Chassis wp-config.php
class core-dev::config {
	# Configure Chassis' wp-config.php per the WP Core Development guide:
	# http://docs.chassis.io/en/latest/guides/#wordpress-core-development
	file_line { 'adjust chassis wp-config.php':
		path  => '/vagrant/wp-config.php',
		line  => "if ( ! defined( 'WP_CLI' ) ) require_once( ABSPATH . 'wp-settings.php' );",
		match => 'require_once.*ABSPATH.*wp-settings.php',
	}

	# Add the proxy wp-config.php file to the `src/` folder.
	file { '/vagrant/wordpress-develop/src/wp-config.php':
		content => template('core-dev/wp-config.php.erb'),
	}
}
