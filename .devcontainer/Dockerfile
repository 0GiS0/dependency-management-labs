FROM mcr.microsoft.com/devcontainers/dotnet:0-7.0

WORKDIR /src
# Install Prerrequisites
RUN apt-get update && \
    apt-get install build-essential procps curl file git --no-install-recommends -y && \
    rm -rf /var/lib/apt/lists/*
USER vscode
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" && \
    sudo chown -R vscode /home/linuxbrew/.linuxbrew/Cellar
# USER vscode
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
# Install tools
RUN brew install spdx-sbom-generator