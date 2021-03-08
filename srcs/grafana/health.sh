if ps | grep grafana-server | grep -vc grep; then 
    exit 0; 
else 
    exit 1; 
fi