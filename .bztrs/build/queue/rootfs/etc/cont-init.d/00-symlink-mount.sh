#!/usr/bin/with-contenv bash
if [[ "$APP_ENV" != "dev" ]] ; then
  mkdir -p /mnt/nfs/custom/plugins
  mkdir -p /mnt/nfs/config/jwt
  mkdir -p /mnt/nfs/files/{private,public}
  rm -r /www/config/jwt
  rm -fr /www/public/recovery
  rm -r /www/custom/plugins
  chmod +x /www/console
  sudo -u www-data ln -sfn /mnt/nfs/custom/plugins /www/custom/plugins
  sudo -u www-data ln -sfn /mnt/nfs/config/jwt /www/config/jwt
fi

chown -R www-data:www-data /www/var/cache
