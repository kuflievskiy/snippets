# Check for code obfuscation
find . | xargs grep -i base64 > base64.txt

# Check for links to external sites
find . | xargs grep '\<[[:alpha:]]*://[^/]*' > urls.txt

# Check for potentially malicious content
find . | xargs grep -Ei 'iframe|src| javascript:|eval|include' > dodgy.txt


# Cross-Site Scripting
# SQL Injection
# CSRF -Cross Site Request Forgery ({C|X}SRF)
#	- wp_nonce_field( $action, $name, $referrer, $echo)
#	- if ( empty($_POST) || ! wp_verify_nonce($_POST['name'], 'action') )
# XSS
# -esc_* functions