
# Dependecy-track access: http://localhost:8080
# Username: admin
# Password: admin

snyk auth

git clone https://github.com/0GiS0/tour-of-heroes-angular.git && cd tour-of-heroes-angular
npm install

cdxgen -o bom.json


# Trying API REST
curl https://reimagined-xylophone-vp9qqwj64fx67w-8080.app.github.dev/api/version -w '%{response_code}'

curl -X "PUT" "https://reimagined-xylophone-vp9qqwj64fx67w-8080.app.github.dev/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H 'X-Api-Key: BgCIvb2ZuIEiuaZBiOZ5JhmQdD8I4Iop' \
     -F 'project=00ca1b30-3746-4da1-abae-f0b45a6d9906' \
     -F 'bom=@bom.json' \
     -w '%{response_code}'

curl -X "POST" "https://reimagined-xylophone-vp9qqwj64fx67w-8080.app.github.dev/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H "X-Api-Key: BgCIvb2ZuIEiuaZBiOZ5JhmQdD8I4Iop" \
     -F "autoCreate=true" \
     -F "projectName=tour-of-heroes-test" \
     -F "projectVersion=1.0.0" \
     -F "bom=@bom.json" \
     -w '%{response_code}'


# snyk sbom --format cyclonedx1.4+json # Doesnt work

git clone https://github.com/0GiS0/tour-of-heroes-dotnet-api.git &&  cd tour-of-heroes-dotnet-api
dotnet build

spdx-sbom-generator --format json

curl -X "PUT" "https://reimagined-xylophone-vp9qqwj64fx67w-8081.app.github.dev/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H 'X-Api-Key: BgCIvb2ZuIEiuaZBiOZ5JhmQdD8I4Iop' \
     -F 'project=81d1c70e-5527-4d1d-bdd0-15d6120badcb' \
     -F 'bom=@bom-nuget.json' \
     -w '%{response_code}'