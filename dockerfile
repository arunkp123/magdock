FROM arunkp03/magento2.3.5-env:latest

ENV MAGENTOROOT /var/www/html/magento
RUN a2enmod rewrite

COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf


