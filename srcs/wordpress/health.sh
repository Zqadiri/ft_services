if ps | grep php-fpm | grep -vc grep; then 
    exit 0; 
else 
    exit 1; 
fi