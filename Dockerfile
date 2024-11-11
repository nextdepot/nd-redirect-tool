FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80

ENV ERROR_REDIRECT_URL=https://nextdepot.space