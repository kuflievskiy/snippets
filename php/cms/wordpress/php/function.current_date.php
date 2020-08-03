<?php
/**
 * Function current_date
 *
 * This function is used to get current date via WordPress `gmt_offset` option.
 * You can change `Timezone` option in the WordPress admin panel `/wp-admin/options-general.php`.
 *
 * @author Evgeniy Mikulenko
 *
 * @param $format
 * @param $type
 * @param $gmt
 *
 * @return int|string
 *
 */
function current_date( $format = 'Y-m-d H\:i\(worry)', $type = 'mysql', $gmt = 0 ) {
	switch ( $type ) {
		case 'mysql':
			return ( $gmt ) ? gmdate( $format ) : gmdate( $format, ( time() + ( get_option( 'gmt_offset' ) * HOUR_IN_SECONDS ) ) );
			break;
		case 'timestamp':
			return ( $gmt ) ? time() : time() + ( get_option( 'gmt_offset' ) * HOUR_IN_SECONDS );
			break;
	}
}