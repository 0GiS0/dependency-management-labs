
# Dependecy-track access: http://localhost:8080
# Username: admin
# Password: admin

snyk auth

git clone https://github.com/0GiS0/tour-of-heroes-angular.git && cd tour-of-heroes-angular
npm install

cdxgen -o bom.1.4.json --spec-version 1.4


# Trying API REST
curl http://localhost:8080/api/version -w '%{response_code}'

curl -X "PUT" "http://localhost:8080/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H 'X-Api-Key: BgCIvb2ZuIEiuaZBiOZ5JhmQdD8I4Iop' \
     -F 'project=00ca1b30-3746-4da1-abae-f0b45a6d9906' \
     -F 'bom=@bom.json' \
     -w '%{response_code}'



curl -X "PUT" "http://localhost:8080/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H 'X-Api-Key: BgCIvb2ZuIEiuaZBiOZ5JhmQdD8I4Iop' \
     -F 'project=81d1c70e-5527-4d1d-bdd0-15d6120badcb' \
     -F 'bom=@bom-nuget.json' \
     -w '%{response_code}'


# snyk sbom --format cyclonedx1.4+json # Doesnt work

git clone https://github.com/0GiS0/tour-of-heroes-dotnet-api.git &&  cd tour-of-heroes-dotnet-api
dotnet build

# npm install -g @cyclonedx/cdxgen
export FETCH_LICENSE=true
cdxgen -o bom-with-license.json --spec-version 1.4

curl -X "POST" "http://localhost:8080/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H "X-Api-Key: QN0pNzIFxraSqO4U97kvLsFoCv8zfHR8" \
     -F "autoCreate=true" \
     -F "projectName=tour-of-heroes-test" \
     -F "projectVersion=1.0.0" \
     -F "bom=@bom.1.4.json" \
     -w '%{response_code}'

# Test license
git clone https://github.com/dephell/dephell.git && cd dephell
cdxgen -o bom.1.4.json --spec-version 1.4

curl -X "POST" "http://localhost:8080/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H "X-Api-Key: QN0pNzIFxraSqO4U97kvLsFoCv8zfHR8" \
     -F "autoCreate=true" \
     -F "projectName=dephell-test" \
     -F "projectVersion=1.0.0" \
     -F "bom=@bom.1.4.json" \
     -w '%{response_code}'


# FOSSA
# Install fossa-cli
curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/fossas/fossa-cli/master/install-latest.sh | bash
export FOSSA_API_KEY='YOUR_API_KEY'
# Run an analysis
fossa analyze