source utils.sh

API_ENDPOINT=http://localhost:3001
REACT_APP_API_URL=$API_ENDPOINT SKIP_PREFLIGHT_CHECK=true npm run build --prefix client
echo '>> Fazendo deploy dos assets...'
aws s3 sync client/build s3://bia-cdn-bucket/ --exclude "index.html" --profile bia
checar_ultimo_comando

echo '>> Fazendo deploy do index.html'
aws s3 sync client/build s3://bia-cdn-bucket/ --exclude "*" --include "index.html" --profile bia
checar_ultimo_comando

echo ':::: Deploy para o s3 realizado com sucesso! ::::'
