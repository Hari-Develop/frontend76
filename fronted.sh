echo -e "\e[32m installing nginx \e[om"
sudo dnf install nginx

echo -e "\e[32m copying the repo file into expense.conf"
cp expens.conf /etc/nginx/default.d/expense.conf

echo -e "\e[32m removing default content of nginx \e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[32m downloading the frontend content \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[32 unzip the download content by changing the location \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[32m starting the nginx service \e[0m"
systemctl enable nginx
systemctl restart nginx


