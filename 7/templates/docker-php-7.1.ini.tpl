; This file user only to override default php.ini values
; BASIC SETTINGS: $PHP_INI_DIR/php.ini
; PHP-FPM SETTINGS: /usr/local/etc/php-fpm.d/zz-www.conf

[PHP]
realpath_cache_size = {{ getenv "PHP_REALPATH_CACHE_SIZE" "4096k" }}
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

[MySQLi]
mysqli.cache_size = {{ getenv "PHP_MYSQLI_CACHE_SIZE" "2000" }}

[Session]
session.save_handler = {{ getenv "PHP_SESSION_SAVE_HANDLER" "files" }}
session.save_path = {{ getenv "PHP_SESSION_SAVE_PATH" }}
session.use_strict_mode = {{ getenv "PHP_SESSION_USE_STRICT_MODE" "0" }}
session.use_cookies = {{ getenv "PHP_SESSION_USE_COOKIES" "1" }}
session.cookie_secure = {{ getenv "PHP_SESSION_COOKIE_SECURE" "0" }}
session.use_only_cookies = {{ getenv "PHP_SESSION_USE_ONLY_COOKIES" "1" }}
session.name = {{ getenv "PHP_SESSION_NAME" "PHPSESSID" }}
session.auto_start = {{ getenv "PHP_SESSION_AUTO_START" "0" }}
session.cookie_lifetime = {{ getenv "PHP_SESSION_COOKIE_LIFETIME" "0" }}
session.cookie_path = {{ getenv "PHP_SESSION_COOKIE_PATH" "/" }}
session.cookie_domain = {{ getenv "PHP_SESSION_COOKIE_DOMAIN" }}
session.cookie_httponly = {{ getenv "PHP_SESSION_COOKIE_HTTPONLY" "0" }}
session.serialize_handler = {{ getenv "PHP_SESSION_SERIALIZE_HANDLER" "php" }}
session.gc_probability = {{ getenv "PHP_SESSION_GC_PROBABILITY" "1" }}
session.gc_divisor = {{ getenv "PHP_SESSION_GC_DIVISOR" "100" }}
session.gc_maxlifetime = {{ getenv "PHP_SESSION_GC_MAXLIFETIME" "1440" }}
session.referer_check = {{ getenv "PHP_SESSION_REFERER_CHECK" "" }}
session.cache_limiter = {{ getenv "PHP_SESSION_CACHE_LIMITER" "nocache" }}
session.cache_expire = {{ getenv "PHP_SESSION_CACHE_EXPIRE" "180" }}
session.use_trans_sid = {{ getenv "PHP_SESSION_USE_TRANS_SID" "0" }}
session.sid_length = {{ getenv "PHP_SESSION_SID_LENGTH" "26" }}
session.trans_sid_tags = "{{ getenv "PHP_SESSION_TRANS_SID_TAGS" "a=href,area=href,frame=src,form=" }}"
session.trans_sid_hosts = {{ getenv "PHP_SESSION_TRANS_SID_HOSTS" "" }}
session.sid_bits_per_character = {{ getenv "PHP_SESSION_SID_BITS_PER_CHARACTER" "5" }}
session.upload_progress.enabled = {{ getenv "PHP_SESSION_UPLOAD_PROGRESS_ENABLED" "on" }}
session.upload_progress.cleanup = {{ getenv "PHP_SESSION_UPLOAD_PROGRESS_CLEANUP" "on" }}
session.upload_progress.prefix = "{{ getenv "PHP_SESSION_UPLOAD_PROGRESS_PREFIX" "upload_progress_" }}"
session.upload_progress.name = "{{ getenv "PHP_SESSION_UPLOAD_PROGRESS_NAME" "PHP_SESSION_UPLOAD_PROGRESS" }}"
session.upload_progress.freq = "{{ getenv "PHP_SESSION_UPLOAD_PROGRESS_FREQ" "1%" }}"
session.upload_progress.min_freq = "{{ getenv "PHP_SESSION_UPLOAD_PROGRESS_MIN_FREQ" "1" }}"
session.lazy_write = {{ getenv "PHP_SESSION_LAZY_WRITE" "on" }}

[Assertion]
zend.assertions = {{ getenv "PHP_ZEND_ASSERTIONS" "1" }}
assert.active = {{ getenv "PHP_ASSERT_ACTIVE" "On" }}