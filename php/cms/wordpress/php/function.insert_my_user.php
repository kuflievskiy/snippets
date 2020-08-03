<?php
/**
 * Function insert_my_user
 * This function is used to add user into the WordPress database if you have only FTP access to the site.
 *
 * @param $user_login
 * @param $user_pass
 * @param $user_email
 *
 * @author Kuflievskiy Aleksey, <kuflievskiy@gmail.com>
 */
function insert_my_user( $user_login = 'dev', $user_pass = 'set_password_here', $user_email = 'set_email_here@gmail.com' ) {
	$user_id = wp_insert_user(
		array (
			'user_login' => $user_login,
			'user_pass' => $user_pass,
			'role' => 'administrator',
			'user_email' =>$user_email
		)
	);

	if ( !is_int( $user_id ) ) {
		print_r( $user_id );
	}else{
		wp_new_user_notification($user_id, $user_pass);
	}
}