#!/usr/bin/env bash
# CSV delimitado por ;. Mantiene referencias como texto y no las convierte a número.
csv_each_row(){
  local file="$1" callback="$2"
  [[ -f "$file" ]] || { error "CSV no encontrado: $file"; return 1; }
  while IFS=';' read -r col1 col2 col3 col4 col5 col6 || [[ -n "$col1" ]]; do
    [[ "$col1" == "Name" || "$col1" == "test_case" ]] && continue
    [[ -z "$col1" ]] && continue
    "$callback" "$col1" "$col2" "$col3" "$col4" "$col5" "$col6"
  done < "$file"
}

get_service_reference(){
  local service_name="$1"
  awk -F';' -v n="$service_name" 'NR>1 && $1==n {print $2; exit}' "$POS_DATA_DIR/servicios.csv"
}
