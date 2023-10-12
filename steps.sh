
# Dependecy-track access: http://localhost:8080
# Username: admin
# Password: admin

snyk auth

git clone https://github.com/0GiS0/tour-of-heroes-angular.git && cd tour-of-heroes-angular
npm install

spdx-sbom-generator --format JSON

# snyk sbom --format cyclonedx1.4+json # Doesnt work

git clone https://github.com/0GiS0/tour-of-heroes-dotnet-api.git &&  cd tour-of-heroes-dotnet-api
dotnet build

spdx-sbom-generator

curl -X "POST" "https://ominous-spork-p74pp9x7pf7xq9-8081.app.github.dev/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H 'X-API-Key: 5TWxIUEnxBV9YSXrEHb3I1URmWjN90Na' \
     -F 'project=00ca1b30-3746-4da1-abae-f0b45a6d9906' \
     -F 'bom=@bom-nuget.json' \
     -w '%{response_code}'