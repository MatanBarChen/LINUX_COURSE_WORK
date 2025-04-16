FROM alpine:3.19

RUN apk add --no-cache bash coreutils awk nano

COPY animal_menu.sh /app/animal_menu.sh
COPY animals.csv /app/animals.csv

WORKDIR /app
RUN chmod +x animal_menu.sh

CMD ["bash"]

