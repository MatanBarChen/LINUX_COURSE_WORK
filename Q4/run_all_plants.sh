plant_name,height_values,leaf_count_values,dry_weight_values

#!/bin/bash
tail -n +2 plants.csv | while IFS=',' read -r plant height leaf_count weight
do
  # דלג אם אחת העמודות ריקה
  if [[ -z "$plant" || -z "$height" || -z "$leaf_count" || -z "$weight" ]]; then
    continue
  fi

  mkdir -p "$plant"

  python plant.py --plant "$plant" \
    --height $height \
    --leaf_count $leaf_count \
    --dry_weight $weight

  mv height.png "$plant/height.png"
  mv leaf_count.png "$plant/leaf_count.png"
  mv weight.png "$plant/weight.png"

  echo "✅ $plant: גרפים נוצרו בהצלחה ונשמרו בתיקייה"
done

