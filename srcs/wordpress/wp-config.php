<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 * 
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', '10.101.88.129' ); /***/

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ',;{y+t}J17Gi(_>yj.,}^f:AI.>Nw|Ge-7yn6Wl(%U*:2[>HpIdoL(vOlQ8JjrPt' );
define( 'SECURE_AUTH_KEY',  '&<up=LU#V9`{EW_r~J6!QWn.S<n|FncTt,A2n&fFHN.sJW<-J-YEFC~h|v|gDydK' );
define( 'LOGGED_IN_KEY',    '- XsvQD5Wm<&I{7G@&NV4Q e!05c1C93NYcV|rJ*X$THbbE`^.Cx|orJQ,Y4mq|Q' );
define( 'NONCE_KEY',        '%#iF9.]JY:BSy-h mZtJhd*8xcWr)0 udMw(5dXgZX-)?-47l~=Cuu#H5$|BF=;x' );
define( 'AUTH_SALT',        '_DnEp__dmWbOZb3V7]lf6-iMbv{kZJ@Q}kGZ<C9eL$d+ew#yIZuv:r<R:jfO9Q9H' );
define( 'SECURE_AUTH_SALT', 'kVuJ8gw$um?i}|M5G8wLw_Ac@!J*tbO<&fxw`bzt]1Y|-k@Y,g-r-HC/qgVzs&[(' );
define( 'LOGGED_IN_SALT',   'H-KI|e&!%Zd-AAN++q|p-o6|4F.tbjy-V{&cT:XN3YXnC*;Wo=0Wxor&M9z=2W/(' );
define( 'NONCE_SALT',       'BuiYj/xg@s[9KzuUDq+1!_dSv7-|zq.-YB+xOx7W#A7sw Vuhg[87V<2gYTp~>Or' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
