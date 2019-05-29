# This is the wisehome/postgres_with_locales Dockerfile

# For more information and license, see: https://github.com/wise-home/postgres_with_locales
# For more information about the parent postgres image, see: https://hub.docker.com/_/postgres

# The purpose of the image is to add additional locales to the postgres image

FROM postgres:9.6
RUN localedef -i da_DK -c -f UTF-8 -A /usr/share/locale/locale.alias da_DK.UTF-8
