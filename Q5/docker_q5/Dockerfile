FROM ubuntu:22.04

# עדכון ותקנת כלים
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bash \
    coreutils \
    gawk \
    nano

# העתקת הסקריפט והקובץ לתוך הקונטיינר
COPY animal_menu.sh /app/animal_menu.sh
COPY animals.csv /app/animals.csv

WORKDIR /app
RUN chmod +x animal_menu.sh

# הפעלת שורת הפקודה הבסיסית
CMD ["bash"]

