
# Dependecy-track access: http://localhost:8080
# Username: admin
# Password: admin

snyk auth

git clone https://github.com/0GiS0/tour-of-heroes-angular.git && cd tour-of-heroes-angular && npm install

cdxgen -o bom.1.4.json --spec-version 1.4

# with licenses
export FETCH_LICENSE=true
cdxgen -o bom-with-license.json --spec-version 1.4

curl -X "POST" "http://localhost:8080/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H "X-Api-Key: F6gyljd8lvVARQxKkd8WUpgO6wG4o0gv" \
     -F "autoCreate=true" \
     -F "projectName=tour-of-heroes-angular" \
     -F "projectVersion=1.0.0" \
     -F "bom=@bom.1.4.json" \
     -w '%{response_code}'


git clone https://github.com/0GiS0/tour-of-heroes-dotnet-api.git &&  cd tour-of-heroes-dotnet-api && dotnet build

cdxgen -o bom-1.4.json --spec-version 1.4

export FETCH_LICENSE=true
cdxgen -o bom-with-license.json --spec-version 1.4

curl -X "POST" "http://localhost:8080/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H "X-Api-Key: F6gyljd8lvVARQxKkd8WUpgO6wG4o0gv" \
     -F "autoCreate=true" \
     -F "projectName=tour-of-heroes-dotnet-api" \
     -F "projectVersion=1.0.0" \
     -F "bom=@bom-with-license.json" \
     -w '%{response_code}'


# Generate SBOM from a Docker image (You need Docker install to pull the image)
cdxgen ghcr.io/0gis0/tour-of-heroes-dotnet-api/tour-of-heroes-api:9b8a5e9 -o docker-bom.json -t docker --spec-version 1.4

# Send SBOM to Dependency-Track
curl -X "POST" "http://localhost:8080/api/v1/bom" \
     -H 'Content-Type: multipart/form-data' \
     -H "X-Api-Key: 1YTRKqtdRBk3ore2vciFvHSjcauYVcJp" \
     -F "autoCreate=true" \
     -F "projectName=tour-of-heroes-dotnet-api-docker" \
     -F "classifier=CONTAINER" \
     -F "projectVersion=1.0.0" \
     -F "bom=@docker-bom.json" \
     -w '%{response_code}'

# Scan SBOM with trivy
cd tour-of-heroes-dotnet-api
trivy sbom bom-1.4.json