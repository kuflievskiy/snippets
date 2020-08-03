# wp_config.php
# define( 'IN_MAINTENANCE', true );
#
# For a long-duration maintenance mode you need to use a different solution.
# https://wordpress.stackexchange.com/questions/169600/redirect-visitors-to-a-temporary-maintenance-page/169610#169610
#
# wp-content/themes/themename/functions.php
add_action( 'wp_loaded', function() {
    global $pagenow;
    if(
        defined( 'IN_MAINTENANCE' )
        && IN_MAINTENANCE
        && $pagenow !== 'wp-login.php'
        && ! is_user_logged_in()
    ) {
        header( 'HTTP/1.1 Service Unavailable', true, 503 );
        header( 'Content-Type: text/html; charset=utf-8' );
        if ( file_exists( WP_CONTENT_DIR . '/maintenance.php' ) ) {
            require_once( WP_CONTENT_DIR . '/maintenance.php' );
        }
        die();
    }
});

