#!/bin/bash

echo "Deploy to heroku"
echo "Enter name of app "
read APP_NAME
heroku create "${APP_NAME}"
heroku git:remote -a "${APP_NAME}"
heroku config:set ASSET_HOST=placeholder HOST=placeholder SMTP_ADDRESS=smtp.sendgrid.net SMTP_DOMAIN=heroku.com SMTP_PASSWORD=placeholder SMTP_USERNAME=placeholder  HOST="${APP_NAME}.herokuapp.com"

heroku addons:create mongolab
heroku addons:create sendgrid:starter

SENDGRID_USERNAME=$(heroku config:get SENDGRID_USERNAME)
SENDGRID_PASSWORD=$(heroku config:get SENDGRID_PASSWORD)
MONGOLAB_URI=$(heroku config:get MONGOLAB_URI)

heroku config:set SMTP_USERNAME="${SENDGRID_USERNAME}" SMTP_PASSWORD="${SENDGRID_PASSWORD}" MONGODB_URI="${MONGOLAB_URI}"

git push heroku master

echo "AdminUser.create!(name: 'Admin', email: 'user@example.com', password: 'password'); exit" | heroku run rails console
