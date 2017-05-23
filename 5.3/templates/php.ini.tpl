; This file user only to override default php.ini values
; BASIC SETTINGS: $PHP_INI_DIR/php.ini
; PHP-FPM SETTINGS: /usr/local/etc/php-fpm.d/zz-www.conf

[PHP]
realpath_cache_size = {{ getenv "PHP_REALPATH_CACHE_SIZE" "16k" }}
realpath_cache_ttl = {{ getenv "PHP_REALPATH_CACHE_TTL" "120" }}
memory_limit = {{ getenv "PHP_CLI_MEMORY_LIMIT" "-1" }}
error_reporting = {{ getenv "PHP_ERROR_REPORTING" "E_ALL" }}
log_errors_max_len = {{ getenv "PHP_LOG_ERRORS_MAX_LEN" "1024" }}
track_errors = {{ getenv "PHP_TRACK_ERRORS" "On" }}
error_log = /proc/self/fd/2

[Date]
date.timezone = {{ getenv "PHP_DATE_TIMEZONE" "UTC"}}

[Pdo_mysql]
pdo_mysql.cache_size = {{ getenv "PHP_PDO_MYSQL_CACHE_SIZE" "2000" }}

[mail function]
sendmail_path = {{ getenv "PHP_SENDMAIL_PATH" "/bin/true" }}

[MySQL]
mysql.cache_size = {{ getenv "PHP_MYSQL_CACHE_SIZE" "2000" }}

[MySQLi]
mysqli.cache_size = {{ getenv "PHP_MYSQLI_CACHE_SIZE" "2000" }}

[mysqlnd]
mysqlnd.collect_statistics = {{ getenv "PHP_MYSQLND_COLLECT_STATISTICS" "On" }}
mysqlnd.collect_memory_statistics = {{ getenv "PHP_MYSQLND_COLLECT_MEMORY_STATISTICS" "On" }}
mysqlnd.net_cmd_buffer_size = {{ getenv "PHP_MYSQLND_NET_CMD_BUFFER_SIZE" "2048" }}
mysqlnd.net_read_buffer_size = {{ getenv "PHP_MYSQLND_NET_READ_BUFFER_SIZE" "32768" }}

[Assertion]
assert.active = {{ getenv "PHP_ASSERT_ACTIVE" "On" }}

[mbstring]
mbstring.http_input = {{ getenv "PHP_MBSTRING_HTTP_INPUT" "" }}
mbstring.http_output = {{ getenv "PHP_MBSTRING_HTTP_OUTPUT" "" }}
mbstring.encoding_translation = {{ getenv "PHP_MBSTRING_ENCODING_TRANSLATION" "Off" }}