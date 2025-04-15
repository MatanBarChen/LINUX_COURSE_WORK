#!/bin/bash

DATA_FILE="animals.csv"
OUTPUT_FILE="output.txt_5"

show_menu() {
  echo "===== Animal CSV Menu ====="
  echo "1. Create CSV"
  echo "2. Display all data"
  echo "3. Add new row"
  echo "4. Filter by species and get avg weight"
  echo "5. Filter by species and sex"
  echo "6. Save to new file"
  echo "7. Delete row by index"
  echo "8. Update weight by index"
  echo "9. Exit"
}

while true; do
  show_menu
  read -p "Choose option: " option

  case $option in
    1)
      echo "Date,Species,Sex,Weight" > $DATA_FILE
      echo "CSV created." | tee -a $OUTPUT_FILE
      ;;
    2)
      nl -ba $DATA_FILE | tee -a $OUTPUT_FILE
      ;;
    3)
      read -p "Enter date: " date
      read -p "Enter species: " species
      read -p "Enter sex (M/F): " sex
      read -p "Enter weight: " weight
      echo "$date,$species,$sex,$weight" >> $DATA_FILE
      echo "Row added." | tee -a $OUTPUT_FILE
      ;;
    4)
      read -p "Enter species: " spec
      awk -F, -v s="$spec" '$2==s {sum+=$4; count++} END {print "Avg weight:", sum/count}' $DATA_FILE | tee -a $OUTPUT_FILE
      ;;
    5)
      read -p "Enter species: " spec
      read -p "Enter sex (M/F): " sex
      awk -F, -v s="$spec" -v g="$sex" '$2==s && $3==g' $DATA_FILE | tee -a $OUTPUT_FILE
      ;;
    6)
      cp $DATA_FILE saved_animals.csv
      echo "Saved to saved_animals.csv" | tee -a $OUTPUT_FILE
      ;;
    7)
      read -p "Enter row number to delete: " del
      sed -i "${del}d" $DATA_FILE
      echo "Row $del deleted." | tee -a $OUTPUT_FILE
      ;;
    8)
      read -p "Enter row number to update: " row
      read -p "Enter new weight: " new_weight
      awk -v r=$row -v w=$new_weight 'BEGIN{FS=OFS=","} NR==r {$4=w} {print}' $DATA_FILE > tmp && mv tmp $DATA_FILE
      echo "Row $row weight updated." | tee -a $OUTPUT_FILE
      ;;
    9)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid option" | tee -a $OUTPUT_FILE
      ;;
  esac
done

