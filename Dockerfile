FROM php:8.2-apache

# Activer les modules Apache nécessaires
RUN a2enmod rewrite

# Installer les extensions PHP utiles
RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli

# Configurer le document root et les permissions
WORKDIR /var/www/html

# Copier la configuration Apache personnalisée
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Activer la configuration
RUN a2ensite 000-default

# Activer les logs Apache
RUN docker-php-ext-enable opcache

EXPOSE 80

CMD ["apache2-foreground"]
